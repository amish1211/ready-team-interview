const express = require('express');
const { GetAllUsers, GetUserById, CreateAUser } = require('./Controllers/UsersController');
const { validateRequest } = require('./Middlewares/validate');
const { getUserSchema, createUserSchema } = require('./Schemas/userSchema');
const app = express();
const port = 5000;


app.use(express.json()); 

app.get('/', async (req, res) => {
  res.send('Hello World from Users Service');
});

app.get('/users',GetAllUsers);
app.get('/users/:id', validateRequest(getUserSchema), GetUserById);
app.post('/users', validateRequest(createUserSchema), CreateAUser);


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
  console.log(`Users Service listening on port ${port}`);
});