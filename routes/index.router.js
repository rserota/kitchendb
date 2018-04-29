const express = require('express')
const router  = express.Router()
const gar     = global.appRoot


router.get('/', function(req, res, next){
    console.log('hi')
    res.sendFile(`${gar}/public/html/index.html`)

})

module.exports = router