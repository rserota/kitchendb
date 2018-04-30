const gar     = global.appRoot
const Pool    = require('pg').Pool
const secrets = require(`${gar}/secrets`)

const pool = module.exports = new Pool({
    user: secrets.pgUser,
    database: secrets.databaseName,
    password: secrets.pgPassword
})
pool.on('error', (err, client) => {
    console.error('Unexpected error on idle client', err)
    throw new Error("oops! db error.")
})


