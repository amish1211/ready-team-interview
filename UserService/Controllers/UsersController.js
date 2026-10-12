const {query} = require('../db/db_init')


async function GetAllUsers(req, res) {
    const rows = await query('SELECT * FROM users ORDER BY id' )
    return res.json(rows)

}

async function CreateAUser(req, res) {
 const {name,email, company_id} = req.body;
 const rows = await query(
    'INSERT INTO Users (name, email, company_id) VALUES ($1, $2, $3) RETURNING *',
    [name, email, company_id]
  );
  res.status(201).json(rows[0]);

  
}

async function GetUserById(req, res) {
    const id = req.params.id;
   const rows = await query(
    `SELECT u.*, c.name AS company_name, c.address
     FROM users u
     JOIN companies c ON c.id = u.company_id
     WHERE u.id = $1`,
    [req.params.id]
  );

  if (!rows.length) return res.status(404).json({ error: 'User not found' });
  res.json(rows[0]);
}


module.exports = {GetAllUsers, CreateAUser, GetUserById}
