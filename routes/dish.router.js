const express = require('express')
const bcrypt  = require('bcryptjs')
const gar     = global.appRoot
const pool    = require(`${gar}/db`)
const router  = express.Router()

// router.get('/dish', function(req, res, next){
//     pool.query(
//         `SELECT id, email, username FROM kdb_user WHERE id=$1`,
//         [req.session.id]
//     ).then(function(result){
//         if ( result.rows.length > 0)
//         res.send(result.rows[0])
//     })
// })

router.post('/dish', async function(req, res, next){
    console.log('body? ', req.body)
    try {
        const dishInsert = await pool.query(
            `INSERT INTO dish (user_id, name, description) VALUES ($1, $2, $3) RETURNING id`,
            [req.session.id, req.body.name, req.body.description]
        )
        const dish_id = dishInsert.rows[0].id
        req.body.ingredients.forEach(async function(ingredient){
            let ingredient_id = null
            const ingredientQuery = await pool.query(
                `SELECT * FROM ingredient WHERE name=$1`,
                [ingredient.name]
            )


            // this ingredient does not yet exist in the database
            if ( ingredientQuery.rows.length === 0 ) {
                const ingredientInsert = await pool.query(
                    `INSERT INTO ingredient (name, description) VALUES ($1, $2) RETURNING id`,
                    [ingredient.name, '...']
                )
                console.log('ing ins ', ingredientInsert)
                ingredient_id = ingredientInsert.rows[0].id

            }
            // exactly one match
            else if ( ingredientQuery.rows.length === 1 ) {
                ingredient_id = ingredientQuery.rows[0].id
            }
            else { throw new Error("Duplicate ingredients")}
            await pool.query(
                `INSERT INTO ingredient_dish (ingredient_id, dish_id) VALUES ($1, $2)`,
                [ingredient_id, dish_id]
            )
        })
        res.send({success:'success'})
    }
    catch(e){
        return next(e)
    }
    

})


module.exports = router