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
title varchar(30),
salary decimal,
department_id int
);

CREATE TABLE department(
name varchar(30)
);

INSERT INTO employee (first_name, last_name, role_id, manager_id) values ('Iliana', 'Vargas', '7459', '8125');
INSERT INTO employee (first_name, last_name, role_id, manager_id) values ('Jose', 'Macias', '8125', '9278');
INSERT INTO employee (first_name, last_name, role_id, manager_id) values ('Richard', 'Lionheart', '1350', '1246');
INSERT INTO employee (first_name, last_name, role_id, manager_id) values ('Victoria', 'Saxe Coburg', '4863', '0583');
INSERT INTO employee (first_name, last_name, role_id, manager_id) values ('Harry', 'Windsor', '0583', '0000');
INSERT INTO employee (first_name, last_name, role_id, manager_id) values ('Meghan', 'Markle', '1486', '0583');

INSERT INTO role (title, salary, department_id) values ('Financial Guru', '25000.00', '3590');
INSERT INTO role (title, salary, department_id) values ('Business Mastermind', '40000.00', '3590');
INSERT INTO role (title, salary, department_id) values ('Tech Specialist', '10000.00', '3086');
INSERT INTO role (title, salary, department_id) values ('Program Manager', '35000.00', '3142');
INSERT INTO role (title, salary, department_id) values ('Chief Executive Offie', '50000.00', '1078');
INSERT INTO role (title, salary, department_id) values ('Assistant to CEO', '10000.00', '1078');

INSERT INTO department (name) values ('Finances');
INSERT INTO department (name) values ('Central Office');
INSERT INTO department (name) values ('Customer Service');
INSERT INTO department (name) values ('Information Technology');


