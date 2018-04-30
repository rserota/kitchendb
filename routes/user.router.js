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
        bcrypt.hash(req.body.password, salt).then( function(hashErr, hashedPassword){
            if (hashErr) { console.log(hashErr) }
            console.log('time to save the user')
            pool.query(`
                INSERT INTO user
            `)
            res.send({todo:'todo'})
        })
    }).catch(function(err){ return next(err) })
})

module.exports = router