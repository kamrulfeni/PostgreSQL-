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
CREATE TABLE "user1"(
    user_id SERIAL PRIMARY KEY ,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    age int DEFAULT 18
)
--##inset types 1

insert into user1 (user_id, username, email, age) VALUES(1,'kamrul', 'kamrul@gmail.com', 94);

--##inset types 2
INSERT INTO user1 (username, email) VALUES('kamrul33','kamrul33@gmail.com'),
('kamrul43', 'kamrul43@gmail.com');
  --##inset types 3
INSERT INTO user1 
 VALUES
(13,'kamrul93', 'kamrul30@gmail.com'),
(14,'kamrul12', 'kamrul50@gmail.com');
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
add column password VARCHAR(255) DEFAULT 'admin66' not null;
ALTER table user1
add column age VARCHAR(255) DEFAULT '22' not null;


ALTER table user1 add column demo int;
--# CHANGE DATATYPE
ALTER TABLE user1
alter COLUMN demo type TEXT;
--#add value in column
ALTER table user1 
alter column country set DEFAULT 'bangladesh';
--#Remove DEFAULT value
ALTER table user1 
alter column country drop DEFAULT;

 select * from user1;

 ---# drop column
 ALTER TABLE user1
 drop column age;
 ALTER TABLE user1
 drop column password;


--# RENAME a column 
ALTER Table user1
RENAME COLUMN demo to country;
--#add CONSTRAINT
ALTER table user1
alter COLUMN country set not null;
ALTER table user1
alter COLUMN country drop not null;
--#add constraint unique 
alter TABLE user1
ADD constraint unique_email UNIQUE(email);
--#drop constraint
alter TABLE user1
drop constraint unique_email;



---# Foreign KEY CONSTRAINT referred 
--Employee table --> each employee belongs to a department 
--department table 
--each department has many employees

CREATE TABLE
    Department (
        deptID SERIAL PRIMARY KEY,
        deptName VARCHAR(50) 
    );
insert into department VALUES (1, 'IT');
--# DELETE row
DELETE FROM department where deptID = 1;
SELECT * FROM department;

create table Employee(
  empID serial PRIMARY KEY,
  empName VARCHAR(50) NOT NULL,
  departmentID INT,
  constraint Fk_constraint_dept
  Foreign Key (departmentID) 
  REFERENCES Department (deptID)
);



insert into Employee VALUES (1, 'kamrul', 1);
DELETE FROM Employee WHERE empID =1;
SELECT * from Employee;