const express = require('express')
const gar     = global.appRoot
const pool    = require(`${gar}/db`)
const router  = express.Router()



router.get('/search', async function(req, res, next){
    console.log('query? ', req.query)
    const dishByName = await pool.query(
        `SELECT * FROM dish
        WHERE name ~* $1 
        ORDER BY name LIMIT 30`,
        [`.*${req.query.q}.*`]
    )
    res.send(dishByName.rows)
})


module.exports = router