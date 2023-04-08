/* SELECT- select helps us to extract data from the tables. It doesn't make any changes to the data*/

create database nautika;
use nautika;

select * from student;

select id, fullname, dob
from student;

/* BASIC using only one column */
select *
from student
where sex = "M";


/********** AND / OR condition ***********/
/*female candidates whose marks is greater than 80 */

select * from student;
select id, fullname, class, mtest, sex
from student
where sex = "F" and Mtest > 80;

select id, fullname, class, mtest, sex
from student
where sex = "F" and sex = "M";

select id, fullname, class, mtest, sex
from student
where sex = "F" or sex = "M";

select * from student;
select id, fullname, class, mtest, sex
from student
where sex = "F" OR Mtest > 80;

/* Ass-2 q4 */
update employee
set first_name = "ino" and last_name = "shiba" /* change u want to make */
where sex = "f" and employee_city = "wi"; /* condition on whose basis u want to change the value*/

/* list all the male students whose mtest marks is greater than 85 
								or 
list all the female students whose ptest marks is greater than 80 */

select * 
from student
where (sex = "m" and mtest > 85) or (sex="f" and ptest > 80);


/* Working with boolean or binary data type
 0 - False , 1 - True */
 
 select * from student; 
 
 select id, fullname, class, remission
 from student 
 where Remission = 0;

							/************** ALIAS ***************/

select id, fullname, mtest as Math_Marks 
from student;

select * from student;

						/* Numerical calculations in SQL */

/* Mathematical operations
+
-
/ 
% remainder (mod)
div Quotient
*
*/

select * from student;

select id, fullname, mtest, ptest, ((mtest + ptest)/2) as Avg_mark
from student;


select id, fullname, mtest, ptest, round((mtest + ptest)/2, 1) as Avg_mark
from student;

select fullname, mtest, mtest div 10 as Quo, mtest mod 10 as Rem
from student;


set sql_safe_updates = 0;

							/****************** IN Statement ******************/
	
select * from student
where hcode = "b";

select * from student
where hcode = "b" or hcode = "g" or hcode = "r";

select * from student
where hcode in ("g", "b", "r");

select * from student
where hcode = "b" and dcode = "ymt";

					/****************** BETWEEN Statement ***********************/

select * from student
where mtest between 60 and 90; /* Numeric data type */


/* discrete - r, g , b, y
continuous - 1,2,3,4,5 */

				/********************** DISTINCT *********************/

/* What is the difference between distinct and unique */

select * from student;

select distinct dcode
from student;

select distinct class, dcode
from student;



		/*********** NESTED Queries ************/
/* Show the id ,fullname, sex, class of the students who is also enrolled in music class */

select * from student;
select * from music;

/*Step 1 to find out the id which are enrolled in music class */
select id from music;
select id from xyz; /* whoever is taking free food */

/* id : 1 - 9 enrolled */

/* Step 2 - manually populated the id from music table */
select * from student
where id between 1 and 9;

select * from student
where id in (1,2,3,4,5,6,7,8,9);

/* NESTED QUERY */
select * from student
where id in (select id from music);


select * from xyz
where id in (select id from xyz2);