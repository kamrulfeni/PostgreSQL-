-- Active: 1693108005998@@127.0.0.1@5432@test2

--Active: 1693108005998@@127.0.0.1@5432@test2

--ALTER DATABASE test3 RENAME to test1;

--# CREATE DATABASE

--CREATE DATABASE db1;

--#RENAME DATABASE

--ALTER DATABASE db1 RENAME TO db2;

--# DELETE DATABASE

-- DROP DATABASE db1;

--# CREATE A STUDENT TABLE

--CREATE TABLE (COLUM,DATA TYPE,CONSTANT)

-- CREATE TABLE student (

--    student_id INT,

--    first_name VARCHAR(50),

--     last_name VARCHAR(50),

--    cgpa NUMERIC(1,2)

-- )

--#3 UPDATE TABLE NAME

--ALTER TABLE student RENAME TO learners;

--## DELETE table

--DROP TABLE learners;

--## CREATE a table with CONSTRAINTS

-- CREATE TABLE "user1"(

--     user_id SERIAL ,

--     username VARCHAR(255) UNIQUE NOT NULL,

--     email VARCHAR(255) UNIQUE NOT NULL,

--     PRIMARY KEY(user_id, username)

--     UNIQUE(username, email)

-- )

-- DROP TABLE student;

CREATE TABLE
    "user1"(
        user_id SERIAL PRIMARY KEY,
        username VARCHAR(255) UNIQUE NOT NULL,
        email VARCHAR(255) UNIQUE NOT NULL,
        age int DEFAULT 18
    ) --##inset types 1

insert into
    user1 (user_id, username, email, age)
VALUES
(
        1,
        'kamrul',
        'kamrul@gmail.com',
        94
    );

--##inset types 2

INSERT INTO
    user1 (username, email)
VALUES
(
        'kamrul33',
        'kamrul33@gmail.com'
    ), (
        'kamrul43',
        'kamrul43@gmail.com'
    );

--##inset types 3

INSERT INTO user1
VALUES (
        13,
        'kamrul93',
        'kamrul30@gmail.com'
    ), (
        14,
        'kamrul12',
        'kamrul50@gmail.com'
    );

SELECT * from user1;

--#Delete all rows in a table without deleting the table

TRUNCATE TABLE user1;

-- DROP TABLE student;

-- insert into user1 values (1,'abc', 'abc@gmail.com');

-- select * from user1;

--insert

-- 1.insert into table-name ( col, col2,....)

-- values(values, values,.....)

-- RETURNING* 'id';

-- 2.insert into table-name values(value1,value2);

-- 3.Insert into table-name(value, value)

-- values(value1,......),(values1, values)

--##--->alter table

-- add a colum, drop a colum,change a datatype of a colum,

--rename a colum, set Default  a value for a colum,

-- add CONSTRAINT to a colum,drop CONSTRAINT for a COLUM

-- table rename

--ALTER TABLE  table_name action

--# adding a colum in a table

ALTER table user1
add
    column password VARCHAR(255) DEFAULT 'admin66' not null;

ALTER table user1 add column age VARCHAR(255) DEFAULT '22' not null;

ALTER table user1 add column demo int;

--# CHANGE DATATYPE

ALTER TABLE user1 alter COLUMN demo type TEXT;

--#add value in column

ALTER table user1 alter column country set DEFAULT 'bangladesh';

--#Remove DEFAULT value

ALTER table user1 alter column country drop DEFAULT;

select * from user1;

---# drop column

ALTER TABLE user1 drop column age;

ALTER TABLE user1 drop column password;

--# RENAME a column

ALTER Table user1 RENAME COLUMN demo to country;

--#add CONSTRAINT

ALTER table user1 alter COLUMN country set not null;

ALTER table user1 alter COLUMN country drop not null;

--#add constraint unique

alter TABLE user1 ADD constraint unique_email UNIQUE(email);

--#drop constraint

alter TABLE user1 drop constraint unique_email;

---# Foreign KEY CONSTRAINT referred

--Employee table --> each employee belongs to a department

--department table

--each department has many employees

CREATE TABLE
    Department (
        deptID SERIAL PRIMARY KEY,
        deptName VARCHAR(50)
    );

insert into department VALUES ( 5,'SALES');

--# DELETE row

DELETE FROM department where deptID = 1;

SELECT * FROM department;

create table
    Employee(
        empID serial PRIMARY KEY,
        empName VARCHAR(50) NOT NULL,
        departmentID INT,
        constraint Fk_constraint_dept Foreign Key (departmentID) REFERENCES Department (deptID)
    );

insert into Employee VALUES (1, 'kamrul', 1);

DELETE FROM Employee WHERE empID =1;

SELECT * from Employee;

create table
    courses (
        course_id SERIAL PRIMARY KEY,
        course_name VARCHAR(255) not NULL,
        description VARCHAR(255),
        publication_date DATE
    );

SELECT * from courses;

---date yyyy-mm-DD

INSERT INTO
    courses (
        course_name,
        description,
        publication_date
    )
VALUES (
        'PostgreSQL for Developer',
        'A complete Postgresql for Developer',
        '2020-07-13'
    ), (
        'PostgreSQL Administration',
        'A postgreSQL Guide DBA',
        NULL
    ), (
        'PostgreSQL High Performance',
        NULL,
        NULL
    ), (
        'PostgreSQL Bootcamp',
        'Learn PostgreSQL Via Bootcamp',
        '2012-09-20'
    ), (
        'Mastering PostgreSQL',
        'Mastering PostgreSQL IN 21 Days',
        '2012-09-12'
    );

---UPDATE DATABASE TABLE ROW

--UPDATE table_name

--set

--column = value1,

--column2 = value2,

--where condition

-- UPDATE courses

--  set

--  course_name = 'PostgreSQL for beginners',

--  description = 'to expert in pstgresql'

-- where course_id = 1;

-- UPDATE courses

--  set

--  course_name = 'PostgreSQL for mastering',

--  description = 'to expert in pstgresql'

-- where course_id > 4;

-- UPDATE courses

--  set

--  course_name = 'PostgreSQL for mastering',

--  description = 'to expert in pstgresql'

-- where course_id > 1 AND course_id < 5;

UPDATE
    courses
set
    course_name = 'PostgreSQL for beginners',
    description = 'to expert in postgresql'
where
    course_id > 1
    AND course_id < 5;

--#delete row

DELETE from courses WHERE course_id = 1;

SELECT * from courses;

---date yyyy-mm-DD

CREATE TABLE
    IF NOT EXISTS department(
        deptID SERIAL PRIMARY KEY,
        name text not null
    );

CREATE TABLE
    IF NOT EXISTS Employee(
        empID SERIAL PRIMARY KEY,
        name text not null,
        email text not null,
        salary INTEGER not null,
        joining_date date not null,
        deptId INTEGER not null,
        CONSTRAINT fk_deptID FOREIGN KEY(deptID) REFERENCES department (deptID)
    );

INSERT INTO
    employee (
        name,
        email,
        salary,
        joining_date
    )
VALUES (
        'amir',
        'Amirl33@gmail.com',
        365356,
        '2012-07-12',
        'IT'
    ), (
        'BIR',
        'BIR@gmail.com',
        66666,
        '2221-07-22',
        'HR'
    );

SELECT * FROM department;

SELECT * FROM Employee;

DROP TABLE employee;

INSERT INTO
    employee (
        name,
        email,
        salary,
        joining_date,
        deptId
    )
VALUES (
        'AMIR',
        'AMIR1@gmail.com',
        36556,
        '2012-07-12',
        1
    ), (
        'BAKER',
        'BAKERl431@gmail.com',
        667666,
        '2221-07-22',
        3
    ), (
        'CELI',
        'CELI33@gmail.com',
        365756,
        '2012-07-12',
        4
    ), (
        'Dulal',
        'Dulal@gmail.com',
        666766,
        '2221-07-22',
        3
    ), (
        'emran',
        'emran3@gmail.com',
        90000,
        '2012-07-12',
        3
    ), (
        'fakir',
        'fakirl43gmail.com',
        50000,
        '2221-07-22',
        2
    ), (
        'gamal',
        'gamal3@gmail.com',
        10000,
        '2012-07-12',
        2
    ), (
        'hanif',
        'hanif@gmail.com',
        6336,
        '2221-07-22',
        5
    ), (
        'kamrul1331',
        'kamrul34@gmail.com',
        7756,
        '2012-07-12',
        5
    ), (
        'ka3mrul3433',
        'kamr3ul434@gmail.com',
        66666,
        '2221-07-22',
        2
    );

---SELECT SOME COLUMN

SELECT empId,name,deptId, salary from employee;

---#inique data

SELECT DISTINCT deptId FROM employee;

---filtering

select * from employee where salary > 60000;

select * from employee where salary > 60000 AND salary <90000;

select * from employee where salary < 60000 OR salary >90000;

--joining date ber kora

select * from employee where joining_date <= '2022-01-09';

--- not er use kisu bad dya

select * from employee WHERE name <> 'kamrul43';

--- not use less and getter than <> ar shate aro condition use kora

select *
from employee
WHERE
    name <> 'kamrul43'
    AND salary < 60000
    OR name = 'kamrul11';

 --# name  order BY NAME ASC;
SELECT * from employee 
ORDER BY name ASC;
 --# name  order BY NAME desc;
SELECT * from employee 
ORDER BY name DESC;

---limit data ORDER BY name ASC limit 10
SELECT * from employee ORDER BY name ASC LIMIT 5;
---limit data AND PAGE ORDER BY name ASC limit 10 
SELECT * from employee ORDER BY name 
ASC LIMIT 5 OFFSET 6;

---#HIGHEST SALARY 
SELECT * FROM employee ORDER BY salary DESC ;
---#HIGHEST SALARY LIMIT 
SELECT * FROM employee ORDER BY salary DESC LIMIT 1;
---# 3RD HIGHEST SALARY FROM EMPLOYEE
SELECT * FROM employee ORDER BY salary DESC 
LIMIT 1 OFFSET 4;