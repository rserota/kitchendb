const express = require('express')
const bcrypt  = require('bcryptjs')
const gar     = global.appRoot
const pool    = require(`${gar}/db`)
const router  = express.Router()

router.get('/user', function(req, res, next){
    res.send({todo:'todo'})
})

router.post('/user', function(req, res, next){
    console.log('body? ', req.body)
    bcrypt.genSalt(11).then( function(salt) {
        console.log('salt? ', salt)
        bcrypt.hash(req.body.password, salt).then( function(hashedPassword){
            console.log('time to save the user')
            console.log(hashedPassword)
            pool.query(
                `INSERT INTO kdb_user (username, email, password) VALUES ($1, $2, $3)`,
                [req.body.username, req.body.email, hashedPassword]
            ).then(function(result){
                console.log('res? ', res)
                res.send({todo:'todo'})
            })
        })
    }).catch(function(err){ return next(err) })
})

router.post('/user/login', function(req, res, next){
    pool.query(
        `SELECT id, username, email, password FROM kdb_user WHERE email=$1`,
        [req.body.email]
    ).then(function(result){
        // found exactly one user! great. 
        if ( result.rows.length === 1 ) {
            let theUser = result.rows[0]
            console.log('user? ', theUser)
            bcrypt.compare(req.body.password, theUser.password).then( function(matched){
                console.log('matched? ', matched)
                if ( !matched ) {
                    return next(new Error("Login Failed"))
                }
                else if ( matched ) {
                    // the user's password hashed to an exact match of the hash stored in the database

                    // 
                    req.session.id = theUser.id
                    res.send({success:'success'})
                }
            }).catch(function(bcryptErr){
                return next(bcryptErr)
            })
        }
        else { return next(new Error("Didn't find a unique user."))}

    })
})

module.exports = router