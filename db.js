const Pool = require('pg').Pool

const pool = module.exports = new Pool()
pool.on('error', (err, client) => {
    console.error('Unexpected error on idle client', err)
    throw new Error("oops! db error.")
})


