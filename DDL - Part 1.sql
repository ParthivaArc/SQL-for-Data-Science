			/**************** DDL *******************/


create database nautika;
use nautika;

/* SQL date time format is YYYY-MM-DD */

select * from student;


create table teacher
(
teacher_id int,
teacher_name varchar(100),
subjects char(10)
);

select * from teacher;

Alter table teacher
Add column salary int;

Alter table teacher
rename column salary to salaried;

/* Alter - add, rename, modify */

truncate table teacher; /* table remains only data is deleted */

drop table teacher; /* data + complete table (columns of the table) both will be deleted */

/*delete- DML (we will learn in DML class)*/

/* Task - Use modify command to change data type of subject column from char to varchar
NOTE- The table teacher will not be present since we used drop table command
Hence you need to recreate the teacher table and then modify the column data type */

use nautika;
select * from student;

alter table student
Modify column Mtest int;