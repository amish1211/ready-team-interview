const express = require('express');
const { GetAllUsers, GetUserById, CreateAUser } = require('./Controllers/UsersController');
const app = express();
const port = 5000;


app.use(express.json()); 

app.get('/', async (req, res) => {
  res.send('Hello World from Users Service');
});

app.get('/users',GetAllUsers);
app.get('/users/:id',GetUserById);
app.post('/users', CreateAUser);



app.listen(port, () => {
  console.log(`Users Service listening on port ${port}`);
});