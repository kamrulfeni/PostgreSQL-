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
VALUES (
        1,
        'kamrul',
        'kamrul@gmail.com',
        94
    );

--##inset types 2

INSERT INTO
    user1 (username, email)
VALUES (
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

UPDATE courses
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

SELECT * from employee ORDER BY name ASC;

--# name  order BY NAME desc;

SELECT * from employee ORDER BY name DESC;

---limit data ORDER BY name ASC limit 10

SELECT * from employee ORDER BY name ASC LIMIT 5;

---limit data AND PAGE ORDER BY name ASC limit 10

SELECT * from employee ORDER BY name ASC LIMIT 5 OFFSET 6;

---#HIGHEST SALARY

SELECT * FROM employee ORDER BY salary DESC ;

---#HIGHEST SALARY LIMIT

SELECT * FROM employee ORDER BY salary DESC LIMIT 1;

---# 3RD HIGHEST SALARY FROM EMPLOYEE

SELECT * FROM employee ORDER BY salary DESC LIMIT 1 OFFSET 4;

----IN ,NOT IN, BETWEEN, LIKE id khuje ber kora and fixed id cara

SELECT * FROM employee where empid IN (2,3,5);

SELECT * FROM employee where empid NOT IN (2,3,5);

---between dia range ar vitre ber kora

SELECT * FROM employee where salary BETWEEN 10000 AND 50000;

---STRING SEARCHING USE LIKE

SELECT * FROM employee WHERE name LIKE 'e%';

---at lest correcter thaka

select * from employee WHERE NAME Like '%mal%';

--last correcter ber kora

select * from employee WHERE NAME Like '%l';

----specific position second position SELECT * FROM employee where name Like '_r'

SELECT * FROM employee where name Like '___m%' 

--- majer corecter specipic

SELECT * FROM employee where name Like '__m_____%' 

--first and last corecter

SELECT * FROM employee where name Like 'g%l';

update employee set deptid = null where empid =1;

---AGGREGATE

select * from employee where deptid is NULL;

---joining two table basics types inner join

select AVG(salary) from employee;

select MIN(salary) from employee;

select max(salary) from employee;

-- GROUP BY DIA ID AVARAGE SALARY BER KORA ID ER

SELECT deptid, sum (salary) from employee group by deptid;

SELECT deptid, AVG (salary) from employee group by deptid;

---AGGREGATE FUNCTION

--JOINING ID by alias

SELECT *
FROM employee e
    RIGHT JOIN department d on e.deptid = d.deptid;

--# GROUP BY dia department name dia

SELECT d.deptname
from employee e
    FULL JOIN department d on e.deptid = d.deptid
GROUP BY d.deptname;

---statastical data find kora GROUP BY and JOIN diaa database ar graf chat korte lage

--2 ways  and coin() count the department total

select
    d.deptname,
    sum(salary),
    avg(salary),
    max(salary),
    count(*)
from department d
    full join employee e on e.deptid = d.deptid
GROUP BY d.deptid;

---# group vy filtering add having 

select
    d.deptname,
    sum(e.salary),
    avg(e.salary),
    max(e.salary),
    count(*) 
from department d
    full join employee e on e.deptid = d.deptid
GROUP BY d.deptname HAVING avg(e.salary) > 60000 ;


---------------------------------------------------------------
practice task
--------------------------------------------
-- Active: 1693108005998@@127.0.0.1@5432@tasks@public

---Task 1:

-- SELECT and WHERE Clause Create a table named "employees" with columns (emp_id,emp_name,department,

--         salary ) and insert the following data:

CREATE TABLE
    employees (
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(50),
        department VARCHAR(50),
        salary DECIMAL(10, 2)
    );

INSERT INTO
    employees (
        emp_id,
        emp_name,
        department,
        salary
    )
VALUES (1, 'John Doe', 'HR', 50000.00), (2, 'Jane Smith', 'IT', 60000.00), (
        3,
        'Michael Johnson',
        'Finance',
        55000.00
    ), (
        4,
        'Emily Brown',
        'HR',
        52000.00
    );

--Write an SQL query to retrieve the names and salaries of employees who work in the "HR" department.

SELECT * from employees;

---TASK ONE SOLUTION

SELECT
    emp_name,
    salary,
    department
from employees
WHERE department = 'HR';

-- Task 2: Aggregation and HAVING Clause Create a table named "orders" with columns (order_id, customer_id,

--  total_amount)and insert the following data:

CREATE TABLE
    orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        total_amount DECIMAL(10, 2)
    );

INSERT INTO
    orders (
        order_id,
        customer_id,
        total_amount
    )
VALUES (101, 1, 200.00), (102, 2, 300.00), (103, 1, 150.00), (104, 3, 400.00), (105, 2, 250.00);

-- Write an SQL query to find the customer IDs

-- and the average total amount of their orders.Display only those customers whose average total amount is greater than

-- or equal to 250.

SELECT * FROM orders;

---# GROUP BY id dia total amout ar avarage ber first and second task done bu alias

SELECT
    customer_id,
    avg(total_amount) as average_total_amount
from orders
GROUP BY customer_id;

---agregate funtion a having dia condition dya  those customers whose average total amount is greater than -- or equal to 250.

SELECT
    customer_id,
    avg(total_amount)
from orders
GROUP BY customer_id
HAVING avg(total_amount) >= 250;

3 ----#Task 3:JOIN and GROUP BY Create two tables named "students"
-- and "courses" with columns as follows:  multiple table ar shate join

CREATE TABLE
    students (
        student_id INT PRIMARY KEY,
        student_name VARCHAR(50),
        age INT,
        gender VARCHAR(10)
    );

CREATE TABLE
    courses (
        course_id INT PRIMARY KEY,
        course_name VARCHAR(50),
        credits INT
    );

INSERT INTO
    students (
        student_id,
        student_name,
        age,
        gender
    )
VALUES (1, 'Alice', 22, 'Female'), (2, 'Bob', 21, 'Male'), (3, 'Charlie', 23, 'Male');

INSERT INTO
    courses (
        course_id,
        course_name,
        credits
    )
VALUES (101, 'Mathematics', 3), (102, 'History', 4), (103, 'Physics', 3);

-- Enrollment table with student-course relationships

CREATE TABLE
    enrollment (
        enrollment_id INT PRIMARY KEY,
        student_id INT,
        course_id INT
    );

INSERT INTO
    enrollment (
        enrollment_id,
        student_id,
        course_id
    )
VALUES (1, 1, 101), (2, 1, 102), (3, 2, 103), (4, 3, 101);

--Write an SQL query to retrieve the student name,course name, and credits for all enrolled courses.

SELECT
    s.student_name,
    cr.course_name,
    cr.credits
From students s
    JOIN enrollment e on e.student_id = s.student_id
    JOIN courses cr on cr.course_id = e.course_id;

-----4-------------------

--Task 4: Multiple Joins and Aggregation Create three tables named "employees," "departments,"and "salaries" with columns as follows:

CREATE TABLE
    employees (
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(50),
        department_id INT
    );

CREATE TABLE
    departments (
        department_id INT PRIMARY KEY,
        department_name VARCHAR(50)
    );

CREATE TABLE salaries ( emp_id INT, salary DECIMAL(10, 2) );

INSERT INTO
    employees (
        emp_id,
        emp_name,
        department_id
    )
VALUES (1, 'John Doe', 1), (2, 'Jane Smith', 2), (3, 'Michael Johnson', 1), (4, 'Emily Brown', 3);

INSERT INTO
    departments (
        department_id,
        department_name
    )
VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

INSERT INTO
    salaries (emp_id, salary)
VALUES (1, 50000.00), (2, 60000.00), (3, 55000.00), (4, 52000.00);

--    Write an SQL query to retrieve the department name

-- and the average salary of employees working in each department.Sort the results by the average salary in descending order.

SELECT
    d.department_name,
    avg(s.salary)
from employees e
    JOIN salaries s on s.emp_id = s.emp_id
    JOIN departments d on e.department_id = d.department_id
GROUP BY department_name
ORDER BY avg(salary) DESC;

---5Task 5: Aggregation and Grouping Create a table named "orders" with columns (  order_id, customer_id, order_date total_amount) and ASCinsert the following data:

CREATE TABLE
    orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        order_date DATE,
        total_amount DECIMAL(10, 2)
    );

INSERT INTO
    orders (
        order_id,
        customer_id,
        order_date,
        total_amount
    )
VALUES (101, 1, '2023-01-05', 200.00), (102, 2, '2023-01-06', 300.00), (103, 1, '2023-02-10', 150.00), (104, 3, '2023-02-15', 400.00), (105, 2, '2023-03-20', 250.00);

--#5.ANSERW

SELECT
    to_char(order_date, 'Month'),
    SUM(total_amount),
    count(*)
from orders
GROUP BY
    to_char(order_date, 'Month');

----6-Using JOINs and Aggregation Create two tables named "employees" and "salaries" with columns as follows:

CREATE TABLE
    employees (
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(50),
        department_id INT
    );

CREATE TABLE salaries ( emp_id INT, salary DECIMAL(10, 2) );

INSERT INTO
    employees (
        emp_id,
        emp_name,
        department_id
    )
VALUES (1, 'John Doe', 1), (2, 'Jane Smith', 2), (3, 'Michael Johnson', 1), (4, 'Emily Brown', 3);

INSERT INTO
    salaries (emp_id, salary)
VALUES (1, 50000.00), (2, 60000.00), (3, 55000.00), (4, 52000.00);

---ANSERWrite an SQL query to retrieve the department name and the average salary of employees in each department,excluding departments with fewer than two employees.

SELECT
    e.department_id,
    AVG(s.salary) AS AverageSalary
FROM employees e
    JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY e.department_id
HAVING COUNT(e.emp_id) >= 2;

-- --Task 7: Using

-- HAVING with Aggregation Create a table named "products" with

--     columns (

--         product_id,

--         product_name,

--         stock_quantity

--     )and insert the following data:

CREATE TABLE
    products (
        product_id INT PRIMARY KEY,
        product_name VARCHAR(50),
        stock_quantity INT
    );

INSERT INTO
    products (
        product_id,
        product_name,
        stock_quantity
    )
VALUES (101, 'Widget A', 20), (102, 'Widget B', 10), (103, 'Widget C', 15), (104, 'Widget D', 5);

--ANS Write an SQL query to find the product names and their total sales quantity for products with a total sales quantity greater than 5.

SELECT
    product_name,
    SUM(stock_quantity) AS total_sales_quantity
FROM products
GROUP BY product_name
HAVING SUM(stock_quantity) > 5;

--8 Task 8: Combining Multiple Joins Create three tables named "customers," "orders,"and "order_items"with columns as follows:

CREATE TABLE
    customers (
        customer_id INT PRIMARY KEY,
        customer_name VARCHAR(50),
        city VARCHAR(50)
    );

CREATE TABLE
    orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        order_date DATE
    );

CREATE TABLE
    order_items (
        item_id INT PRIMARY KEY,
        order_id INT,
        product_name VARCHAR(50),
        quantity INT
    );

INSERT INTO
    customers (
        customer_id,
        customer_name,
        city
    )
VALUES (1, 'John Doe', 'New York'), (2, 'Jane Smith', 'Los Angeles'), (
        3,
        'Michael Johnson',
        'Chicago'
    );

INSERT INTO
    orders (
        order_id,
        customer_id,
        order_date
    )
VALUES (101, 1, '2023-01-05'), (102, 2, '2023-02-10'), (103, 1, '2023-02-15');

INSERT INTO
    order_items (
        item_id,
        order_id,
        product_name,
        quantity
    )
VALUES (1, 101, 'Widget A', 2), (2, 101, 'Widget B', 3), (3, 102, 'Widget C', 1), (4, 103, 'Widget A', 4);

---8 ANsWrite an SQL query to retrieve the customer name,order date,nd the total quantity of items ordered for each order.

-- ORDER BY Clause: ORDER BY o.order_date: Orders the final result

-- set by "order_date" in ascending order, which means the results will be displayed in chronological order based on the order date.

SELECT
    c.customer_name,
    o.order_date,
    SUM(oi.quantity) AS total_quantity
FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY
    c.customer_name,
    o.order_date
ORDER BY o.order_date;

----9

CREATE TABLE
    sales (
        sale_id INT PRIMARY KEY,
        product_id INT,
        sale_date DATE,
        sale_amount DECIMAL(10, 2)
    );

INSERT INTO
    sales (
        sale_id,
        product_id,
        sale_date,
        sale_amount
    )
VALUES (1, 101, '2023-01-05', 200.00), (2, 102, '2023-01-06', 300.00), (3, 101, '2023-02-10', 150.00), (4, 103, '2023-02-15', 400.00), (5, 102, '2023-03-20', 250.00);

9 ---ans Write an SQL query to find the total sales amount for each product.However,if the total sales amount is less than 300,show it as 0.
-- CASE: Starts a conditional expression.

-- WHEN SUM(sale_amount) >= 300 THEN SUM(sale_amount):

-- When the sum of sale amounts for a product is greater than

-- or equal to 300,

-- it will

-- show

--     the actual total sales amount.

-- ELSE 0: If the sum of sale amounts for a product is less than 300,

-- it will

-- show 0 as the total sales amount.

SELECT
    product_id,
    CASE
        WHEN SUM(sale_amount) >= 300 THEN SUM(sale_amount)
        ELSE 0
    END AS total_sales_amount
FROM sales
GROUP BY product_id;

---10 Task 10: Combining Multiple Aggregates Create a table named "students"

-- with columns (student_id, student_name, age) and

-- insert the following data:

CREATE TABLE
    students (
        student_id INT PRIMARY KEY,
        student_name VARCHAR(50),
        age INT
    );

INSERT INTO
    students (student_id, student_name, age)
VALUES (1, 'Alice', 22), (2, 'Bob', 21), (3, 'Charlie', 23);

-- 10ans Write an SQL query to find the minimum,

-- maximum,

-- and average age of all students.

SELECT
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    AVG(age) AS avg_age
FROM students;


-- Active: 1693108005998@@127.0.0.1@5432@test4@public

create TABLE
    department (
        department_id INT PRIMARY KEY,
        Department_name VARCHAR(100)
    );

CREATE TABLE
    employees (
        employee_id INT PRIMARY KEY,
        full_name VARCHAR(100),
        department_id INT,
        job_role VARCHAR(100),
        manager_id INT,
        Foreign Key (department_id) REFERENCES department(department_id)
    );

select * FROM employees;

select * FROM department;

INSERT INTO
    department(
        department_id,
        department_name
    )
VALUES(1, 'executive');

INSERT INTO
    department(
        department_id,
        department_name
    )
VALUES(2, 'HR');

INSERT INTO
    department(
        department_id,
        department_name
    )
VALUES(3, 'Sales');

INSERT INTO
    department(
        department_id,
        department_name
    )
VALUES(4, 'Development');

INSERT INTO
    department(
        department_id,
        department_name
    )
VALUES(5, 'Support');

INSERT INTO
    department(
        department_id,
        department_name
    )
VALUES(6, 'Research');

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(1, 'John Smith', 1, 'CEO', NULL);

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(2, 'Sarah Goodes', 1, 'CEO', 1);

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(3, 'John Smith', 1, 'CEO', 1);

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(
        4,
        'Michelle Carey',
        2,
        'HR Manager',
        1
    );

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(
        5,
        'Chris Matthews',
        3,
        'Sale Manager',
        2
    );

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(
        6,
        'Andrew Judd',
        4,
        'Development Manager',
        3
    );

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(
        7,
        'Abir Hosssain',
        5,
        'Support Manager',
        3
    );

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(
        8,
        'Happy Akter',
        2,
        'HR Representative',
        4
    );

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(
        9,
        'Roni Talukder',
        2,
        'Sales Person',
        5
    );

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(
        10,
        'Hyder Hossain',
        3,
        'Sales Person',
        5
    );

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(
        11,
        'Jenin Voss',
        4,
        'Frontend Developer',
        5
    );

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(
        12,
        'Happy Akter',
        4,
        'Backend Developer',
        6
    );

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(
        13,
        'Happy Akter',
        4,
        'Backend Developer',
        6
    );

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(
        14,
        'Happy Akter',
        NULL,
        'Support',
        7
    );

INSERT INTO
    employees (
        employee_id,
        full_name,
        department_id,
        job_role,
        manager_id
    )
VALUES
(
        15,
        'Sakib Ahammed',
        5,
        'Support',
        7
    );

SELECT
    employees.full_name,
    employees.job_role,
    department.department_name
From employees
    INNER JOIN department ON department.department_id = employees.department_id;

SELECT *
From employees
    INNER JOIN department ON department.department_id = employees.department_id;

select * from employees;

SELECT *
From employees
    LEFT JOIN department ON department.department_id = employees.department_id;

--legt join a left er  data thakbe

SELECT *
From employees
    RIGHT JOIN department ON department.department_id = employees.department_id;

SELECT *
From employees
    FULL JOIN department ON department.department_id = employees.department_id;

SELECT * from employees NATURAL JOIN department;

SELECT * from employees CROSS JOIN department;

---AGGREGATE funtion