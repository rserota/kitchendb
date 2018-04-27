const express = require('express')
const router  = express.Router()
const db      = require('../models/db')
const utils   = require('../utils')
const gar     = global.appRoot


router.get('/', function(req, res, next){
    console.log('session? ', req.session)

    // request has no code in either the session or query string: create a 32 character code, create a new user with that code, then store the code in the session.
    if ( !req.session.code && !req.query.code ) {
        const newCode = utils.createCode()
        console.log('newCode? ', newCode)
        const newUser = new db.User({
            code: newCode,
            items: []
        })
        newUser.save(function(err){
            if (err) {
                console.log('err? ', err)
                return next(err)
            }
            else {
                req.session.code = newCode
                console.log(newUser)
                req.session._id  = newUser._id.toString()
                res.sendFile(`${gar}/public/html/index.html`)
            }
        })
    }

    // request has a code in the query string
    // set the code on their session, then redirect them back to the home page without the query string
    if ( req.query.code ) {
        req.session.code = req.query.code
        res.redirect('/')
    }

    // request has a code in the session, but not in the query string
    if ( !req.query.code && req.session.code ) {
        db.User.findOne({code: req.session.code}, function(err, user){
            if (err) { return next(err)}
            console.log('user? ', user)

            // no db error, but we also didn't find a user matching the code.
            if ( !user ) {
                const newUser = new db.User({
                    code: req.session.code,
                    items: [],
                })
                newUser.save(function(err){
                    if (err) { return next(err) }
                    else {
                        req.session._id = newUser._id.toString()
                        res.sendFile(`${gar}/public/html/index.html`)
                    }
                })
            }
            else {
                req.session._id = user._id.toString()
                res.sendFile(`${gar}/public/html/index.html`)

            }
            
        })
    }


})

module.exports = router