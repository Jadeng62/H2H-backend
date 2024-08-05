const pgp = require("pg-promise")();
require("dotenv").config();

// const cn = {
//   host: process.env.PG_HOST,
//   port: process.env.PG_PORT,
//   database: process.env.PG_DATABASE,
//   user: process.env.PG_USER,
//   password: process.env.PG_PASSWORD,
// };

// const cn = process.env.CONNECTION_STRING
const connectionstring = process.env.CONNECTION_STRING
// const db = pgp(cn);
const db = pgp(connectionstring);
module.exports = db;
