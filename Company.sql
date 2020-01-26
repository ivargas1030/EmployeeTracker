DROP DATABASE if exists company;
CREATE DATABASE Company;
USE Company;
CREATE TABLE employee (
id INTEGER(10) AUTO_INCREMENT NOT NULL,
PRIMARY KEY (id),
first_name varchar(30),
last_name varchar(30),
role_id int,
manager_id int
);

CREATE TABLE role (
id INTEGER(10) AUTO_INCREMENT NOT NULL,
PRIMARY KEY (id),
title varchar(30),
salary decimal,
department_id int
);

CREATE TABLE department(
id INTEGER(10) AUTO_INCREMENT NOT NULL,
PRIMARY KEY (id),
name varchar(30)
);

INSERT INTO employee (first_name, last_name, role_id, manager_id) values ('Iliana', 'Macias', 1, 2);
INSERT INTO employee (first_name, last_name, role_id, manager_id) values ('Jose', 'Vargas', 2, 5);
INSERT INTO employee (first_name, last_name, role_id, manager_id) values ('Richard', 'Lionheart', 3, 5);
INSERT INTO employee (first_name, last_name, role_id, manager_id) values ('Victoria', 'Saxe Coburg', 4, 5);
INSERT INTO employee (first_name, last_name, role_id, manager_id) values ('Harry', 'Windsor', 5, null);
INSERT INTO employee (first_name, last_name, role_id, manager_id) values ('Meghan', 'Markle', 6, 2);

INSERT INTO role (title, salary, department_id) values ('Financial Guru', '25000.00', 1);
INSERT INTO role (title, salary, department_id) values ('Business Mastermind', '40000.00', 1);
INSERT INTO role (title, salary, department_id) values ('Tech Specialist', '10000.00', 4);
INSERT INTO role (title, salary, department_id) values ('Program Manager', '35000.00', 3);
INSERT INTO role (title, salary, department_id) values ('Chief Executive Officer', '50000.00', 2);
INSERT INTO role (title, salary, department_id) values ('Assistant to CEO', '10000.00', 2);

INSERT INTO department (name) values ('Finances');
INSERT INTO department (name) values ('Central Office');
INSERT INTO department (name) values ('Customer Service');
INSERT INTO department (name) values ('Information Technology');

SELECT * FROM employee;
SELECT * FROM department;

/*SELECT first_name, last_name
FROM employee
INNER JOIN department ON employee.department = department.id




