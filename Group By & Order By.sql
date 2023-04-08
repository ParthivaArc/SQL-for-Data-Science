/*Group By - To Summarize and calculate some key calculations at 
different group levels. Eg - How many low income, middle income and 
high income customers do we have in our bank? In this case, you'll first 
have to group the data by income column. And, then calculate Sum of Income*/

use student;

select class from student;

/*List the total number of students in each class*/
SELECT Class, Count(*) as TotalStudsofEachClass
FROM Student
Group By Class;

select * from student
where class = "1b";

select * from student;

/* Avg marks classwise */
select class, avg(mtest) as avg_Maths
from student
group by class;

/* Total marks class wise */
select class, sum(mtest) as TotalMarks_Maths
from student
group by class;

select * from student where class='T';

/* Task - To find the max and min score of each class */
select class, Max(Mtest), Min(Mtest)
from student
group by class;

select * from student;

/* CONCEPT */ - # Abhishek and Saloni
SELECT Class, Count(*) as CntStar, Count(ID) as CntID, Count(class) as CntClass #1A - 7,7,7   #1B - 4,4,4    #1C - 3,3,3
FROM Student 
Group By Class;

select * from student where class = '1A';

/*List the total number of girls in each class*/
SELECT Class, Count(Class) as TotalGirlsinEachClass
FROM Student
WHERE SEX = "m" 
Group By Class;

select * from student where sex ='f' and class='t';


/***************** HAVING Clause ******************/
/*List the total no. of girsl in each class. 
Show only those classes where there are at least 2 female*/
SELECT Class, Count(Class) as TotalGirlsinEachClass /*4*/
FROM Student  /*1*/
WHERE Sex = "F" /*2*/
Group By Class /*3*/
HAVING Count(Class) >= 2; /*5*/

select * from student where class = '1b';
select * from student where class = '1b' and sex='f'; #can't use why? because here we are only getting female students

/* what is the difference between where and having */

/* Execution sequence - From -> where -> joins -> group by -> select + agg fn -> having -> order by -> limit

/*List the total students in each class. Also, show the 
total girls in each class. But only show those classes where
there are at least two females*/
select class, count(class) as TotalStudents,
sum(if(sex = "f", 1,0)) as TotalGirls
from student
group by class
HAVING TotalGirls >= 2;

SELECT * FROM Student;


/*---- SORTING - Order By*/
/*You can order the data in Desc or Asc orders by one or more columns. 
The default ordering is in ASC order. Ordering can be applied a text col, date col, numeric col*/
select * from student;

SELECT ID, FullName, Class, Sex, Mtest
FROM Student
Order By mtest asc;

SELECT ID, FullName, Class, Sex, Mtest
FROM Student
Order By 3;

SELECT Class, Count(*) as TotalStudents
FROM Student
Group By Class
Order By class desc;

/*Multi level sorting is always hierchical in nature. It matters what you sort the data first by*/
/*List the students' marks in desc order by gender and by class */
SELECT ID, FullName, Class, Sex, Mtest
FROM Student
Order By Class, Sex, Mtest DESC;

select * from student;

SELECT FullName, Dcode, Class, Mtest
FROM Student
Order By Dcode, Class ASC, Mtest DESC;

Use Student;

/*Question - List the students of each class. What will you do? Write your query.
Ans: 
a) Order By 
b) Group By*/

SELECT Class, FullName
FROM Student
Order By Class;

select class, fullname
from student
group by class; 

/*Task - Find the no. of students in each class.
Show the data in asc order by the no of students*/


				/********* LIMIT ***********/
/*Limit the number of records to fetch*/
/*Limt - Specify how many records you want to query*/
SELECT FullName, Mtest 
FROM Student 
Order By Mtest DESC;

SELECT FullName, Mtest 
FROM Student 
Order By Mtest DESC
Limit 5;

#what will be my query if I want to see the bottom 5 students name and their marks
SELECT FullName, Mtest 
FROM Student 
Order By Mtest desc
Limit 5;

/* Limit with Offset 
Limit n, m -> ignore the first n rows, then do Limit m */
SELECT FullName, Mtest 
FROM Student 
Order By Mtest DESC
Limit 2,5;































SELECT Class, Count(*) as Cnt
FROM Student
Group By class
Order by 2 ASC;