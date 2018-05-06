const express = require('express')
const gar     = global.appRoot
const pool    = require(`${gar}/db`)
const router  = express.Router()



router.get('/search', async function(req, res, next){
    console.log('query? ', req.query)
    res.send({success:'success'})
})


module.exports = router