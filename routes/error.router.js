const app = require('../server')
const gar = global.appRoot 

// if none of our other routes matched, then this request is a 404 error
app.use(function(req, res, next){
    res.status(404).sendFile(`${gar}/public/html/404.html`)
})

// generic 500 error handler
app.use(function(err, req, res, next){
    console.log('500 error: ', err)
    res.status(500).sendFile(`${gar}/public/html/500.html`)
})