const express = require('express')
const router  = express.Router()
const db      = require('../models/db')

router.get('/user', function(req, res, next){
    console.log('get the user')
    db.User.findOne({code:req.session.code})
        .populate('items')
        .exec(function(err, user){
            res.send(user)
        })
})


router.post('/user/sort', function(req, res, next){
    db.User.findOne({code: req.session.code}, function(err, user){
        if (err) { return next(err) }
        else if (!user) { return next(new Error("User not found"))}
        else {
            user.sortOrder = -user.sortOrder
            user.save(function(err){
                if (err) {return next(err)}
                res.send({success:'success'})
            })
        }

    })
})

module.exports = router