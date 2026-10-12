const express = require('express');
const { GetAllCompanies, GetAllCompaniesById, CreateCompany } = require('./Controllers/CompaniesController');
const { validate } = require('./Middlewares/validate');
const { createCompanySchema, companyIdParamsSchema } = require('./Schemas/companySchema');
const app = express();
const port = 3000;


app.use(express.json()); 

app.get('/', async (req, res) => {
  res.send('Hello World from Company Service');
});

app.get('/companies',GetAllCompanies);
app.get('/companies/:id',validate('params',companyIdParamsSchema),GetAllCompaniesById);
app.post('/companies', validate('body',createCompanySchema), CreateCompany);


app.use((req, res, next) => {
  const error = new Error(`Not Found - ${req.originalUrl}`);
  res.status(404);
  next(error);
});

app.use((err, req, res, next) => {
  const statusCode = res.statusCode === 200 ? 500 : res.statusCode;
  res.status(statusCode).json({
    status: 'error',
    message: err.message,
  });
});



app.listen(port, () => {
  console.log(`Companies Service listening on port ${port}`);
});


