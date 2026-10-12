const {query} = require('../db/db_init')


async function GetAllCompanies(req, res) {
    const rows = await query('SELECT * FROM companies ORDER BY id' )
    return res.json(rows)

}

async function CreateCompany(req, res) {
 const {name,address} = req.body;
 const rows = await query(
    'INSERT INTO companies (name, address) VALUES ($1, $2) RETURNING *',
    [name, address]
  );
  res.status(201).json(rows[0]);
}

async function GetAllCompaniesById(req, res) {
    const id = req.params.id;
    const rows = await query('SELECT * FROM companies WHERE id = $1', [id]);
    if (!rows.length) {
        return res.status(404).json({error:'Company Not Found'});
    }
    return res.json(rows[0]);

}


module.exports = {GetAllCompanies, CreateCompany, GetAllCompaniesById}
