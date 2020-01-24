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

INSERT INTO employee (first_name, last_name) values ('Iliana', 'Vargas');
INSERT INTO employee (first_name, last_name) values ('Alex', 'Macias');
