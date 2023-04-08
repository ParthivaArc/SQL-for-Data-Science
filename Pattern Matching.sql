/*Pattern Matching
Eg - Names that start with letter "P"
Or Names that end with "ra"
Or Names that don't contain a or r anywhere
Or Names that contain "a" as the third character


Then, you use Like or NOT LIKE with wild card operators
% : Any number or alphanumeric characters, incl. zero length string (meaning - nothing) 
_ : Has to be replaced with one char / one no. / one spl char, including space*/

use nautika;
select * from student;

/*Names starting with "p"*/
select fullname
from student
where fullname Like "p%";


/*Names that end with "a"*/
select fullname
from student
where fullname like "%a";


/*Names that contain "i" somewhere*/
select fullname
from student
where fullname like "%i%";

select fullname
from student
where fullname like "%I%"; /* Writing I will not show results for uppercase I */


/*Names that don't contain "a" anywhere*/
select fullname
from student
where fullname not like "%a%";


/*Names that contain "r" as the second letter*/
select fullname
from student
where fullname like "_r%";



/* Upper case and Lower case*/

select fullname
from student
where binary fullname like "%r%";

select fullname
from student
where binary fullname like "%R%";

/*Names that contain smallcase "r" as the second letter*/
select fullname
from student
where binary fullname like "_r%";

/*Task - Names that contain uppercase "r" */
select fullname
from student
where binary fullname like "_R%";


/*Task - Names that contain "r" as the third letter*/
select fullname
from student
where fullname like "__r%"; #  __r%


/*Names that contain "p" as the second laster letter*/
select fullname
from student
where fullname like "%p_";


/*Names that starts with P and has alphabet a*/
select fullname
from student
where fullname like "P%" and fullname like "%a%";

select fullname
from student
where FullName like "R%a%";

/*Questions:
1. List the students who come from districts that contain Y in the district name
2. List the students who are playing instruments that contain
letter "p" somewhere.
3. List the instruments played by students whose names start 
with letter capital "A". 
4. List the students whose name contain small case "u"
 as the second letter.
5. List the students whose name contain "u" or "r" somewhere 
*/


/*1. List the students who come from districts that contain Y in the district name*/
SELECT FullName, Dcode
from student 
where Dcode Like "%Y%";


/*2. List the students who are playing instruments that contain
letter "p" somewhere.*/
Select ID, FullName
From Student 
where ID IN (select ID from Music
          where Type like "%p%");


/*3. List the instruments played by students whose names start 
with letter capital "A".*/
Select Type
from music
where ID in (select ID from student
             where Binary FullName like "A%");
             
/*4. List the students whose name contain small case "u"
 as the second letter.*/
Select FullName
from student
where binary FullName like "_u%";


/*5. List the students whose name contain "u" or "r" somewhere */
Select FullName
from student 
where FullName like "%u%" or fullname like "%r%";




/*For Advanced Pattern Matching - Regular Expressions
Eg: 
Names that contain either a or z in the third position, but 
don't contain p anywhere.


How?
Use RegExp or Rlike commands. Would advise to use RegExp to avoid any confusion with Like / not Like.

Syntax
SELECT FullName Will give fullname that contain A or R somewhere
FROM Customer
WHERE FullName RegExp "[ar]"
*/

#fullname like "%a%" or fullname like "%r%"

/*Names that contain a or r*/
SELECT FullName
FROM Student
where fullname regexp "[ar]"; /*[] is treated as a char list and inside the [] we give character set. Here a and r are treated as different characters/letters*/

/* Names that are not starting or ending with vowel */
SELECT FullName
FROM Student
where fullname not regexp "^[aeiou]" and fullname not regexp "[aeiou]$";


/*Names that contain capital case "A" or "R". Use binary keyword*/
SELECT FullName
FROM Student
where binary fullname regexp "[AR]"; /*[] is treated as a char list*/


/*Names that start with a or r*/
SELECT FullName
FROM Student
WHERE FullName RegExp "^[ar]"; #since we are not using binary keyword that means A or R can be caps or small


/*Names that end with a or r*/
SELECT FullName
FROM Student
WHERE FullName RegExp "[ar]$";


/*Names containing r as the third character*/
SELECT FullName
FROM Student
WHERE FullName RegExp "^..r";   # "__r"


/*Names that have "r" in the second position and capital A or P as the last char*/
select fullname
from student
where fullname regexp "^.[r]" and binary fullname regexp "[AP]$";


/*SECOND Method - Names that have "r" in the second position and "a" as the last char*/
SELECT FullName
FROM Student
WHERE FullName RegExp "^.[r][a-z]*a$"; # ^[like] and [comment]

SELECT FullName
FROM Student
WHERE FullName RegExp "^[ra]"; # R and A is individual entity

SELECT FullName
FROM Student
WHERE FullName RegExp "^ra"; /* treating ra as one unit */ 

/*Names that have a or r in the third position*/
SELECT FullName
FROM Student
WHERE FullName RegExp "^..[ar]";


/*Names that don't contain "a" anywhere*/
SELECT fullName
FROM Student
WHERE FullName NOT RegExp "a";


/*Names that don't start with "a"*/
SELECT fullName
FROM Student
WHERE FullName NOT RegExp "^a";


/*Names that don't contain "a" as third char*/
SELECT fullName
FROM Student
WHERE FullName NOT RegExp "^..a";


/*Names that start with "ma" or "ru"*/
SELECT FullName
FROM Student 
WHERE FullName RegExp "^(ma)|^(ru)"; # | - or
				/******* OR ******/
SELECT FullName
FROM Student
where fullname regexp "^ma" or fullname regexp "^ru";

/* Task - Does not Contains only a b c or d*/ 
SELECT FullName
FROM Student
WHERE FullName RegExp "[e-z]";


/* Task - Names that contain only - a u or e*/
select fullname
from student
where fullname regexp "^[aue][aue]*[aue]$";

/* where fullname regexp [aue]

^[aue] - Starts with a/u/e
[aue]* - middle a/u/e
[aue]$ - ends with a/u/e

*/
/* Assignment - Perform the same set of questions which u did using like in the class*/