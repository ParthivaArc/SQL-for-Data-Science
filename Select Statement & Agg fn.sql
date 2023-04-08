/*Select Statement Introduction
Select helps you to extract data from the tables.
Doesn't make any change to the tables.

Ideal steps to write Select statement:
1. Visualize the output / report that you want to create
2. Think of the execution sequence (From which table, what conditions, what do we have to select)
3. Write the Select Statement
*/

Use school_db;

alter table student
modify column Remission tinyint(1);

/*How do you filter rows*/
SELECT *
FROM Student;

/* BASIC */
Select * from student where sex = "f";

select Fullname, sex, Mtest
from student
where PTest >70;

/* task - list the student id, name who has failed in maths. Fail criteria <35 marks*/

/*Multiple conditions - AND OR condition*/
/*List of females who have scored more than 80 in Maths */
SELECT ID, FullName, Sex, Mtest
FROM Student
WHERE Sex = "F" AND Mtest > 80;

SELECT ID, FullName, Sex, Mtest
FROM Student
WHERE Sex = "F" AND Mtest > 100;

SELECT ID, FullName, Sex, Mtest
FROM Student
WHERE Sex = "F" OR Mtest > 80;

/*List of females who have scored more than 80 in Maths
Or List of males who have score more than 90 in Maths*/
SELECT ID, FullName, Sex, Mtest
FROM Student
WHERE (Sex = "F" AND Mtest > 80) OR (Sex = "M" AND Mtest > 90);

/* Task- List of females who have scored more than 90 in Maths or  List of males who have score more than 80 in Maths*/
SELECT ID, FullName, MTest, SEx
FROM Student
WHERE (SEX = "F" AND Mtest > 90) OR
(SEX = "M" AND Mtest > 95);

/*Handle boolean / binary values in SQL
You can compare the boolean field with True / False / 0 / 1*/
SELECT FullName, Remission
FROM Student
WHERE Remission = True;

SELECT FullName, Remission
FROM Student
WHERE Remission = False;

/* Task - How to handle different cell values in SQL*/
SELECT ID, FullName, SEx
FROM Student
WHERE Sex = "F" AND Remission = False;



/*Numeric Calculations in SQL*/
SELECT FullName, Mtest as Maths, ((Mtest + Ptest) / 2) AS Avg
FROM Student;

SELECT FullName, Mtest as Maths, Round((Mtest + Ptest) / 2,2) AS Avg
FROM Student;

/*Mod - gives you remainder*/
SELECT FullName, Mtest, Mtest mod 10 AS Remainder,
Mtest % 10 as R2
FROM Student;

/*Quotient of a division - Use Div*/
SELECT FullName, Mtest, Mtest div 10 AS Q
FROM Student;

/* Task - Write a query to find the remainder and quotient of ptest marks when divided by 2 of all the students. Also Show id, fullname and class and ptest*/
SELECT id, FullName, class, Ptest, Ptest div 2 AS Q, Ptest mod 2 as Rem
FROM Student;


/*NOTE - */
SELECT id, FullName, class, Ptest, Ptest div 2 AS Q, Ptest mod 2 as Rem
FROM Student
where rem<>0; /* will not work */

select *
from (SELECT id, FullName, class, Ptest, Ptest div 2 AS Q, Ptest mod 2 as Rem
FROM Student) as t1
where rem <> 0;

/*Mathematical Operators in SQL
+ Addition
- Subtraction
* Multipication
/ division
% Remainder (Mod)

Logical Operators in SQL
>
=
<
>=
<=
<> - Not Equals to
*/

SELECT Fullname, Round((Mtest + Ptest)/2,1) as AvgFinalScore
FROM Student;


SELECT FullName, Round(((Mtest + Ptest) / 2)*.35,1) as FinalScore
FROM Student;


				/****** In Statement  *********/
select * from student
where Hcode = "G"; /* single condition */

select *
from student
where HCode in ("G", "B"); /* multi condition */

select * from student where id in (1,2,3);


/* Task show name, id and class of students from class 1A and 2A*/
select fullname, id, class
from student
where Class in ("1A", "2A");


							/********** Between *********/
/* List the students who have scored between 70 and 80 and 90 and 100 */
select fullname, ID, mtest 
from student
where (mtest between 50 and 60) or (mtest between 90 and 100);


/*Distinct - Extract different values from a list
Remember there is a difference between a distinct
list of values and unique list of values*/
select * from student;

select distinct dcode from student; /* only distinct dcode */

SELECt Distinct DCode, Class /* distinct dcode ine ach class */
FROM Student;

/* ignore as of now */
/*How do we handle Null values in SQL*/
SELECT * From Student;

SELECT ID, Fullname, Class
FROM Student
WHERE Dcode IS Null;

/*IfNull*/
Select FullName, IfNull(Class, "No Class Assigned") as ClassStatus
FROM Student;

/********** NESTED QUERY ************/

/* Show the student id and fullname who also is enrolled in music class*/
/*STEP -1 Identifying students who take music classes*/
select id from music;

/*STEP - 2 Now putting those id which we got in step-1 in the where condition of the next statement*/
select * from student;

select id, fullname
from student
where id in (1,2,3,4,5,6,7,8,9);

select id, fullname
from student
where id between 1 and 9;

/* now using nested query*/
select id, fullname
from student
where id in (select id from music);

select s.id, fullname
from student as s inner join music as m
where s.id = m.id;



		/***** Aggregation functions *******/
select * from student;
select sum(mtest) from student;

select avg(mtest) from student;

select min(mtest) from student;

select max(mtest) from student;

select * from student;

Select count(*) from student;

select class from student;

select count(class) from student; 
select count( distinct class) from student;

select * from student;
select id from student;
select count(id) from student; 
select sum(id) from student;