const express = require('express')
const bcrypt  = require('bcryptjs')
const gar     = global.appRoot
const pool    = require(`${gar}/db`)
const router  = express.Router()

router.get('/user', async function(req, res, next){
    try {

        const userQuery = await pool.query( `
            SELECT kdb_user.id AS id, kdb_user.email AS email, kdb_user.username AS username,
                menu.id AS menu_id, menu.name AS menu_name, menu.description AS menu_description
            FROM kdb_user 
            LEFT JOIN menu ON kdb_user.id=menu.user_id
            WHERE kdb_user.id=$1

        `, [req.session.id]
        )
        res.send(userQuery.rows)
    }
    catch(e){
        console.log(e)
        return next(e)
    }
})

router.get('/user/dish', async function(req, res, next){
    try {
        const userQuery = await pool.query( `
            SELECT kdb_user.id AS id, kdb_user.email AS email, kdb_user.username AS username,
                dish.id AS dish_id, dish.name AS dish_name, dish.description AS dish_description
            FROM kdb_user 
            LEFT JOIN dish ON kdb_user.id=dish.user_id
            WHERE kdb_user.id=$1

        `, [req.session.id]
        )
        res.send(userQuery.rows)

    }
    catch(e){
        console.log(e)
        return next(e)
    }
})

router.post('/user', async function(req, res, next){
    try {

        console.log('new user body? ', req.body)
        const salt = await bcrypt.genSalt(11)
        console.log('salt? ', salt)
        const hashedPassword = await bcrypt.hash(req.body.password, salt)
        console.log('time to save the user')
        console.log(hashedPassword)
        const userInsert = await pool.query(
            `INSERT INTO kdb_user (username, email, password) VALUES ($1, $2, $3) RETURNING id`,
            [req.body.username, req.body.email, hashedPassword]
        )
        console.log("reeeesult: ", result)
        req.session.id = result.rows[0].id
        res.send({
            success:'success',
            alert: {
                heading: "Account created:",
                body:  `Now you can share your recipes with other users.`,
                class: 'alert-success'
            }
        })
    }
    catch(e){
        res.send({
            failure:'failure',
            alert: {
                heading: "Signup Failed:",
                body:  `Try again later.`,
                class: 'alert-danger'
            }
        })
    }
})

router.post('/user/login', function(req, res, next){
    pool.query(
        `SELECT id, username, email, password FROM kdb_user WHERE email=$1`,
        [req.body.email]
    ).then(function(result){
        // found exactly one user! great. 
        if ( result.rows.length === 1 ) {
            let theUser = result.rows[0]
            console.log('user? ', theUser)
            bcrypt.compare(req.body.password, theUser.password).then( function(matched){
                console.log('matched? ', matched)
                if ( !matched ) {
                    res.send({
                        failure:'failure',
                        alert: {
                            heading: "Login Failed:",
                            body:  `Email or password was incorrect.`,
                            class: 'alert-danger'
                        }
                    })
                }
                else if ( matched ) {
                    // the user's password hashed to an exact match of the hash stored in the database

                    // 
                    req.session.id = theUser.id
                    res.send({success:'success'})
                }
            }).catch(function(bcryptErr){
                return next(bcryptErr)
            })
        }
        else if (result.rows.length === 0 ) {
            res.send({
                failure:'failure',
                alert: {
                    heading: "Login Failed:",
                    body:  `Email or password was incorrect.`,
                    class: 'alert-danger'
                }
            })
        }
        else { return next(new Error("Didn't find a unique user."))}

    })
})

module.exports = router