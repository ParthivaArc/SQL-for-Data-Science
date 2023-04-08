/* Task to do- 
1. Create the database - retail_shop
 
2. Create a table in the db name it as customer
- Create columns in each table
- Assign data types (Type of data a column can store)
(4 imp data types:
: Integer - Cust_id and Age
: String / Character / Text - Cust_Name , Cust_City
: Date - DOB
: Binary / Boolean (yes / no) - Marital_status
- Create PK constraint

3. 	ALTER Statements-
	Add a new column to it of any data type - Salary
	Change the column name - Marital
    Change the data type of the marital column - boolean
    Drop Marital column
    Add constraints
    Drop constraints
*/

/*1. Create database*/
CREATE DATABASE retail_shop;

/*2. Create the tables in the database*/
Use retail_shop;

CREATE TABLE customer
(Cust_ID INT,
Cust_Name Char(100),
Cust_City VarChar(100),
DOB Date,
Age int,
Marital_status binary,
Constraint c_id primary key(Cust_ID),  /***** PK ******/
Constraint age_chk Check(Age > 20) /******* Check constraint ******/
);

create table orders
(Order_ID int,
Order_date date,
CID int,
Constraint o_pk primary key(Order_ID),
Constraint o_fk foreign key(CID) references customer(Cust_ID) /******** FK ***********/
); 

create table product
(product_id int,
product_name char(100),
product_type char(100),
constraint p_pk primary key(product_id)
);


create table order_product
(o_id int,
P_id int,
constraint op_fk1 foreign key(o_id) references orders(Order_ID),
constraint op_fk2 foreign key(P_id) references product(product_ID),
constraint op_pk primary key(o_id,p_id) /***** Composite primary key *******/
);


										/******** Alter **********/

/*1. Add a new column to customer */
ALter table customer /* step-1 mention which table u want to alter/change */
Add column salary int; /* step-2 which column u want to change and what change u want to make */

/* 2. Rewrite a column name */
Alter table customer
Rename column Cust_City to customer_city;

/*3. Change the data type of marital_status column from binary to boolean */
/*Alter table customer*/


select * from customer; /* SQL is mostly not case sensititive */
select * from CUSTOMER;
select * from CuStOmEr;

/** DROP - column **/
alter table customer
drop column salary;

/** DROP - table **/
drop table jdguawkjd;

select * from CuStOmEr;
select * from orders;

/* 11-12-2022 */

/* ADD column salary in customer table */
Alter table customer
add column salary int;


/********** INSERT *********/

Insert into Customer(Cust_ID, Cust_name, Customer_city, DOB, Age, Marital_Status, Salary)
Values(101, "Parthiva", "Guwahati", "1996-09-27", 26, 0, 10000);

select * from customer;

Insert into customer(salary, Cust_id, Age, Cust_name, customer_city)
Values(20000, 201, 45, "Azeem", "Delhi");


Insert into customer(salary, Cust_id, Age, Cust_name, customer_city)
Values(30000, 301, 65, "Saloni", "Bombay"),
(15000, 401, 23, "Anirudha", "Indore"),
(50000, 601, 33, "Punk", "Kolkata");

Insert into customer(salary, Cust_id, Age, Cust_name, customer_city)
Values(30000, 301, 65, "Saloni", "Bombay"),
(15000, 401, 23, "Anirudha", "Indore");

/** ADDing more constraints **/

Alter table customer
modify column cust_name char(100) not null;


/* Checking the constraints work - age > 20, name not null*/

Insert into customer(salary, Cust_id, Age, Cust_name, customer_city)
Values(20000, 801, 19, "Azeem", "Delhi"); /* Age constraint fails*/

Insert into customer(salary, Cust_id, Age, Cust_name, customer_city)
Values(20000, 801, 25, NULL, "Delhi"); 

			/********* UPDATE **********/
		
        select * from customer;
        
Update customer
SET customer_city = "Bangalore" /* the new name you want to change to */
where customer_city = "Kolkata"; /* Exisiting name */

Update customer
SET salary = 20000, customer_city ="Gurgaon"
where cust_id = 101;


			/************ DELETE ***********/
Delete from customer
where cust_id = 201; /* Conditionally remove */

Delete from customer
where cust_ID in (101,301, 401);




/*******************************************************************************/


CREATE DATABASE retail_shop_USA;

/*2. Create the tables in the database*/
Use retail_shop_USA;

CREATE TABLE customer_USA
(Cust_ID INT,
Cust_Name Char(100),
Cust_City VarChar(100),
DOB Date,
Age int,
Marital_status binary,
Constraint c_id primary key(Cust_ID) /***** PK ******/
);

alter table customer_USA
add column salary int;

Insert into customer_USA(salary, Cust_id, Age, Cust_name, cust_city)
Values(3000, 701, 69, "Leo", "NY"),
(1500, 801, 29, "Macy", "LA");

select * from customer_USA;

use retail_shop;

Insert into customer(cust_id, customer_city, cust_name, Age, salary) /* the destination table columns */
select cust_id, cust_city, cust_name, age, salary /* source table column */
from retail_shop_USA.customer_USA;