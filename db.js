const Pool = require('pg').Pool

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'UnknowDB',
  password: 'root',
  port: 5432,
});

const poolConnect = pool
.connect()
.then(poolPromise =>{
    console.log("Connected to MSSQL");
    return poolPromise;
})
.catch(err => console.log("Database Connection Failed ! Bad Config: ", err));

module.exports = pool