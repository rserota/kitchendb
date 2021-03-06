const express = require('express')
const gar     = global.appRoot
const pool    = require(`${gar}/db`)
const router  = express.Router()

router.get('/dish', function(req, res, next){
    // console.log('query?? ', req.query)
    pool.query(
        `SELECT dish.*, ingredient.name AS ingredient_name, kdb_user.username AS username
        FROM dish 
        INNER JOIN ingredient_dish ON dish.id=ingredient_dish.dish_id
        INNER JOIN ingredient ON ingredient.id=ingredient_dish.ingredient_id
        LEFT JOIN kdb_user ON kdb_user.id=dish.user_id
        WHERE dish.id=$1`,
        [req.query.id]
    ).then(function(result){
        // console.log('dish result? ', result.rows)
        res.send(result.rows)
    })
})

router.post('/dish', async function(req, res, next){
    // console.log('body? ', req.body)
    try {
        const dishInsert = await pool.query(
            `INSERT INTO dish (user_id, name, description, preparation) VALUES ($1, $2, $3, $4) RETURNING id`,
            [req.session.id, req.body.name, req.body.description, req.body.preparation]
        )
        const dish_id = dishInsert.rows[0].id
        for ( let ingredient of req.body.ingredients ) {

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
                // console.log('ing ins ', ingredientInsert)
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
        }
        res.send({
            success:'success',
            alert: {
                heading: "Dish Submitted:",
                body:  `Successfully added ${req.body.name}.`,
                class: 'alert-success'
            }
        })
    }
    catch(e){
        console.log(e.constraint)
        if ( e.constraint === "dish_description_key" ) {
            res.send({
                failure: "failure",
                alert: {
                    heading: "Dish submission failed:",
                    body: `That version of ${req.body.name} is already in the database.`,
                    class: 'alert-danger'
                }
            })
        }
        else { return next(e) }
    }
    

})


module.exports = router