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
                ` INSERT INTO kdb_user (username, email, password) VALUES ($1, $2, $3) `,
                [req.body.username, req.body.email, hashedPassword]
            ).then(function(result){
                console.log('res? ', res)
                res.send({todo:'todo'})
            })
        })
    }).catch(function(err){ return next(err) })
})

router.post('/user/login', function(req, res, next){
    console.log('body? ', req.body)
    res.send({todo:'todo'})
})

module.exports = router