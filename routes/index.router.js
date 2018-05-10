const express = require('express')
const router  = express.Router()
const gar     = global.appRoot


router.get('/', function(req, res, next){
    res.sendFile(`${gar}/public/html/index.html`)
})

router.get('/logout', function(req, res){
    req.session.reset()
    res.redirect('/')
})


module.exports = router