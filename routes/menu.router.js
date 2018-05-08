const express = require('express')
const gar     = global.appRoot
const pool    = require(`${gar}/db`)
const router  = express.Router()

// router.get('/dish', function(req, res, next){
//     console.log('query?? ', req.query)
//     pool.query(
//         `SELECT dish.*, ingredient.name AS ingredient_name, kdb_user.username AS username
//         FROM dish 
//         INNER JOIN ingredient_dish ON dish.id=ingredient_dish.dish_id
//         INNER JOIN ingredient ON ingredient.id=ingredient_dish.ingredient_id
//         LEFT JOIN kdb_user ON kdb_user.id=dish.user_id
//         WHERE dish.id=$1`,
//         [req.query.id]
//     ).then(function(result){
//         console.log('dish result? ', result.rows)
//         res.send(result.rows)
//     })
// })

router.post('/menu', async function(req, res, next){
    console.log('body? ', req.body)
    try {
        const menuInsert = await pool.query(
            `INSERT INTO menu (user_id, name, description) VALUES ($1, $2, $3) RETURNING id`,
            [req.session.id, req.body.name, req.body.description]
        )
        res.send({
            success:'success',
            alert: {
                heading: "Menu Submitted:",
                body:  `Now you can search for dishes to add to ${req.body.name}.`,
                class: 'alert-success'
            }
        })
    }
    catch(e){
        return next(e)
    }
    

})


module.exports = router