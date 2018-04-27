const express = require('express')
const router  = express.Router()
const db      = require('../models/db')

router.post('/item', function(req, res, next){
    console.log('body? ', req.body)
    console.log('session? ', req.session)
    db.Item.find({owner: req.session._id}, function(err, items){
        if (err) { return next(err)}
        const matched = items.filter(function(item){
            return item.text === req.body.item
        })
        if ( matched.length == 0 ) {
            newItem = new db.Item({text: req.body.item, owner: req.session._id})
            newItem.save(function(err){
                if (err) { return next(err) }
                db.User.update({code: req.session.code}, {$push: {items:newItem._id} }, function(err){
                    if (err) { return next(err)}
                    res.send({success:'success'})
                })
            })
            
        }
        else if ( matched.length > 0 ) { return next(new Error("duplicate entry")) }
        else { return next(new Error("Something went wrong."))}
    })

})

router.put('/item/:_id', function(req, res, next){
    db.Item.findOne({_id: req.params._id}, function(err, item){
        if (err) { return next(err) }
        else if (!item){ return next(new Error('no item found'))}
        else {
            item.done = !item.done
            item.save(function(err){
                if (err) { return next(err) }
                res.send({success:'success'})
            })
        }
    })
})

router.delete('/item/:_id', function(req, res, next){
    db.Item.deleteOne({_id:req.params._id}, function(err){
        if (err) { return next(err) }
        console.log('success!')
        res.send({success:'success'})
    })

})

module.exports = router