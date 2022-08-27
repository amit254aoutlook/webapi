// const express = require('express');
// var port = process.env.port || 1337;
// const bodyParser = require('body-parser');
// const cors = require("cors");
// const app = express();
// // create application/x-www-form-urlencoded parser
// app.use(bodyParser.urlencoded({extended: true}));
// // parse requests of content-type - application/json
// app.use(bodyParser.json());

// var employeeController = require('./app/controller/employee.controller')();

// app.use("/api/employees", employeeController);

// // app.get("/product",function(request,response)
// // {
// //     response.json({"Message":"Welcome to Node js"});
// // })

// app.listen(port, function () {
//     var datetime= new Date();
//     var message= "Server running on Port :- "+port+" Started at :- "+ datetime;
//     console.log(message);
// });
const sequelize = require('./app/config/db.config');  
const express = require("express");
var session = require('express-session');
//const multer=require('multer');
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require('path');
const app = express();
app.use(express.static('public'));

// var corsOptions = {
//   origin: "http://localhost:8081"
// };
//global.__basedir = __dirname;
app.use(express.static(__dirname+"./public/"));
//app.use(cors(corsOptions));
app.use(cors()) // Use this after the variable declaration
// parse requests of content-type - application/json
//app.use(multer);
app.use(bodyParser.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

app.use(session({
  key: 'user_sid',
  secret: 'somerandonstuffs',
  resave: false,
  saveUninitialized: false,
  cookie: {
      expires: 600000
  }
}));

// This middleware will check if user's cookie is still saved in browser and user is not set, then automatically log the user out.
// This usually happens when you stop your express server after login, your cookie still remains saved in the browser.
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,POST,OPTIONS,DELETE,PUT');
  if (!req.session.user) {
      res.clearCookie('user_sid');        
  }
  next();
});

app.use(cors()) // Use this after the variable declaration

const db = require("./app/models");
const multer = require('multer');
//const Role = db.Roles;

db.sequelize.sync();

//test the database connection  
// sequelize    
//   .authenticate()    
//   .then(() => {    
//     console.log('Connection has been established successfully.');    
//   })    
//   .catch(err => {    
//     console.error('Unable to connect to the database:', err);    
//   }); 

// simple route
app.get("/", (req, res) => {
  res.json({ message: "Welcome to Amit application." });
});

// routes
require('./app/routes/auth.routes')(app);
require('./app/routes/user.routes')(app);
require('./app/routes/admin.routes')(app);
// set port, listen for requests
const PORT = process.env.PORT || 1337;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
app.use(express.static(path.join(__dirname, '/public')));


// const app = express();
// app.use(...);

// const db = require("./app/models");

// db.sequelize.sync();