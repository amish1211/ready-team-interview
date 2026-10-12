const fs = require('node:fs');
const path = require('node:path');
const { Pool } = require('pg');
 

const pool = new Pool({
  host: process.env.PGHOST || 'localhost',
  port: Number(process.env.PGPORT) || 5432,
  user: process.env.PGUSER,
  password: process.env.PGPASSWORD,
  database: process.env.PGDATABASE,
});
 

async function query(text, params) {
  const result = await pool.query(text, params);
  return result.rows;
}

module.exports = {pool, query}