const express = require('express')
const gar     = global.appRoot
const pool    = require(`${gar}/db`)
const router  = express.Router()



router.get('/search', async function(req, res, next){
    console.log('query? ', req.query)
    let searchBy = req.query.searchBy || 'name'
    console.log(searchBy)
    if ( searchBy === 'name' ) {
        console.log('search by name')
        const dishByName = await pool.query(
            `SELECT * FROM dish
            WHERE name ~* $1 
            ORDER BY name LIMIT 30`,
            [`.*${req.query.q}.*`]
        )
        res.send(dishByName.rows)
    }
    else if ( searchBy === 'ingredient' ) {
        console.log('search by ingredient')
        const dishByIngredient = await pool.query(
            `SELECT DISTINCT dish.*
            FROM dish
            INNER JOIN ingredient_dish ON dish.id=ingredient_dish.dish_id
            INNER JOIN ingredient ON ingredient_dish.ingredient_id=ingredient.id
            WHERE ingredient.name ~* $1 
            ORDER BY dish.name LIMIT 30`,
            [`.*${req.query.q}.*`]
        )
        res.send(dishByIngredient.rows)

    }
    else { return next(new Error("Invalid search parameter"))}
})

router.get('/search/')

module.exports = router