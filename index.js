var mysql = require("mysql");
var inquirer = require("inquirer");
var password = require("./password");
//var table = require("console.table");

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
        name: "action",
        type: "list",
        message: "What would you like to do?",
        choices: ["View All Employees", "View All Employees by Department", "View All Employees by Manager", "Add Employee", "Remove Employee", "Exit"]
      })
      .then(function(answer) {
        switch (answer.action) {
        case "View All Employees":
          listEmployees();
          break;
  
        case "View All Employees by Department":
          showEmployeeDepartment();
          break;
  
        case "View All Employees by Manager":
          showEmployeeManager();
          break;
  
        case "Add Employee":
          addEmployee();
          break;

        case "Remove Employee":
          removeEmployee();
          break;
  
        case "exit":
          connection.end();
          break;
        }
    });
 
function listEmployees() {
    connection.query("SELECT * FROM employee", function(err, results) {
      if (err) throw err;
      console.table(results);
      start();
      })};

function showEmployeeDepartment() {
    connection.query("SELECT * FROM department", function(err, results) {
        if (err) throw err;
        console.table(results);
        start();
        })};

function showEmployeeManager() {
    connection.query("SELECT manager_id FROM employee", function(err, results) {
        if (err) throw err;
        console.table(results);
        start();
        })};

// function to add a new employee record
function addEmployee() {
    // prompt for employee name
    inquirer
      .prompt([
        {
          name: "first",
          type: "input",
          message: "Enter a first name"
        },
        {
          name: "last",
          type: "input",
          message: "Enter a last name"
        },
        
      ])
      .then(function(answer) {
        // when finished prompting, insert a new item into the db with that info
        connection.query(
          "INSERT INTO employee SET ?",
          {
            first_name: answer.first,
            last_name: answer.last,
          },
          function(err) {
            if (err) throw err;
            console.log("Your employee was added successfully!");
            // re-prompt the user
            start();
          }
        );
      });
    }

// function to remove an employee record
function removeEmployee() {
    // prompt for employee name
    inquirer
      .prompt([
        {
          name: "id",
          type: "input",
          message: "Enter employee ID"
        },
      ])
      .then(function(answer) {
        // when finished prompting, insert a new item into the db with that info
        connection.query(
          "DELETE FROM employee WHERE id = ? LIMIT 1",
          {
            id: answer.id,
          },
          function(err) {
            if (err) throw err;
            console.log("Your employee was deleted successfully!");
            // re-prompt the user
            start();
          }
        );
      });
    }
}