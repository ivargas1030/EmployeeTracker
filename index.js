var mysql = require("mysql");
var inquirer = require("inquirer");
var password = require("./password");

// create the connection information for the sql database
var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: password,
  database: "Company"
});

// connect to the mysql server and sql database
connection.connect(function(err) {
  if (err) throw err;
  // run the start function after the connection is made to prompt the user
  start();
  console.log("Connected to the database")
});

// function which prompts the user for what action they should take
function start() {
    inquirer
      .prompt({
        name: "Action",
        type: "list",
        message: "What would you like to do ?",
        choices: ["View All Employees", "View All Employees by Department", "View All Employees by Manager", "Add Emloyee", "Remove Employee"]
      })
      .then(function(answer) {
        // based on their answer, either call the bid or the post functions
        if (answer.postOrBid === "POST") {
          postAuction();
        }
        else if(answer.postOrBid === "BID") {
          bidAuction();
        } else{
          connection.end();
        }
      });
  }
