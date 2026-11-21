USE employee;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100));
    USE employee;

CREATE TABLE location (
    location_id INT PRIMARY KEY,
    location VARCHAR(30));
    USE employee;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id));
USE employee;

ALTER TABLE employees
ADD COLUMN email VARCHAR(100);
USE employee;

ALTER TABLE employees
MODIFY COLUMN designation VARCHAR(255);
USE employee;

ALTER TABLE employees
DROP COLUMN age;
USE employee;

ALTER TABLE employees
CHANGE COLUMN hire_date date_of_joining DATE;
USE employee;

RENAME TABLE departments TO Departments_Info;
RENAME TABLE location TO Locations;
USE employee;

TRUNCATE TABLE employees;
USE employee;

DROP TABLE employees;
DROP DATABASE employee;
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F') CHECK (gender IN ('M', 'F')),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    CONSTRAINT fk_dept FOREIGN KEY (department_id) REFERENCES departments(department_id),
    CONSTRAINT fk_loc FOREIGN KEY (location_id) REFERENCES location(location_id)
);