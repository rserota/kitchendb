const express        = require('express')
const bodyParser     = require('body-parser')
const sessionsModule = require('client-sessions')
const HTTPS          = require('https')
const fs             = require('fs')
// const db             = require('./models/db')
const secrets        = require('./secrets')
const app            = module.exports = express()

global.appRoot = __dirname

const sessionMiddleware = sessionsModule({
    cookieName: '_kitchendb_session',  
    secret: secrets.cookieSecret,
    requestKey: 'session',
    duration: (86400 * 1000) * 7, // one week in milliseconds
    cookie: {
        ephemeral: false,     // when true, cookie expires when browser is closed
        httpOnly: true,       // when true, the cookie is not accesbile via front-end JavaScript
    }
})


app.use(express.static('./public'))
app.use(bodyParser.json())
app.use(sessionMiddleware)

app.use(function(req, res, next){
    console.log('session? ', req.session)
    next()
})

app.use(require('./routes/index.router'))
app.use(require('./routes/user.router'))
app.use(require('./routes/dish.router'))
app.use(require('./routes/search.router'))
require('./routes/error.router')

try {
    const httpsConfig = {
        key: fs.readFileSync('/etc/letsencrypt/live/listmaker.biz/privkey.pem'),
        cert: fs.readFileSync('/etc/letsencrypt/live/listmaker.biz/cert.pem'),
    }

    const httpsServer = HTTPS.createServer(httpsConfig, app)
    httpsServer.listen(443)
    const httpApp = express()
    httpApp.use(function(req, res, next){
        res.redirect('https://www.listmaker.biz' + req.url)
    })
    httpApp.listen(80)
}
catch(e){
    console.log(e)
    console.log('could not start HTTPS server')
    app.listen(80)
}