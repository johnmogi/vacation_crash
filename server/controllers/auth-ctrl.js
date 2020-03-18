const mysql = require("mysql");
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "tourist"
});
const express = require("express");

const authLogic = require("../business-logic/auth-logic");
const router = express.Router();

// GET http://localhost:3000/api/users
router.get("/users", async (request, response) => {
  try {
    const users = await authLogic.getAllUsersAsync();
    response.json(users);
  } catch (err) {
    response.status(500).send(err.message);
  }
});
// GET http://localhost:3000/api/users/1
router.get("/users/:id", async (request, response) => {
  try {
    const id = +request.params.id;
    const user = await authLogic.getOneUserAsync(id);
    response.json(user);
  } catch (err) {
    response.status(500).send(err.message);
  }
});

// Sign-up: http://localhost:3003/api/auth/register

router.post("/register", async (request, response) => {
  try {
    const user = request.body;
    const addedUser = await authLogic.addUserAsync(user);
    response.status(201).json(addedUser);
  } catch (err) {
    response.status(500).send(err.message);
  }
});

// Log-in: http://localhost:3003/api/auth/login
router.post("/login2", async (request, response) => {

  try {

const user = request.body //מכיל כבר האדרס
// console.log(user)
    // const user = await authLogic.isUserExist(username, password);
     const userCheck = await authLogic.isUserExist(user);
     console.log(userCheck)
if (userCheck.length === 0){
throw "User is wrong"
}
    response
      .status(201)
      .json(userCheck)
     
  } catch (err) {
   response.status(500).send(err);
  }
});

// http://localhost:3003/api/auth/status

router.post("/status", async (request, response) => {
  // if (!request.session.isLoggedIn) {
  //   response.status(403).send("Access Denied! Please Log-In!");
  //   return;
  // }
  if (!request.session.loggedin) {
    response.status(403).send("Access Denied! Please Log-In!");
    return;
  }

  try {
    response.status(201).send("user is logged");
  } catch (err) {
    response.status(500).send(err.message);
  }
});

// Log-out:
router.post("/logout", (request, response) => {
  try {
    request.session.destroy();
    response.send("user is logged-out");
  } catch (err) {
    response.status(500).send(err.message);
  }
});
router.post("/test", function(request, response) {
  connection.connect(err => {
    if (err) {
      console.error(err);
      return;
    }
    console.log("We're connected to Tourist on MySQL.");
  });

  var username = request.body.username;
  var password = request.body.password;
  if (username && password) {
    connection.query(
      "SELECT * FROM users WHERE userName = ? AND password = ?",
      [username, password],
      function(error, results, fields) {
        if (results.length > 0) {
          request.session.loggedin = true;
          request.session.username = username;
          response.redirect("http://localhost:3003/api/auth/loggedin");
        } else {
          response.send("Incorrect Username and/or Password!");
        }
        response.end();
      }
    );
  } else {
    response.send("Please enter Username and Password!");
    response.end();
  }
});

router.get("/loggedin", function(request, response) {
  if (request.session.loggedin) {
    response.send("Welcome back, " + request.session.username + "!");
  } else {
    response.send("Please login to view this page!");
  }
  response.end();
});

module.exports = router;
