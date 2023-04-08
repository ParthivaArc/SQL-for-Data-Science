/*Union - Gives distinct elements from the unioned sets. Common rows will be counted once.*/
/*Union clause will work if the following two conditions are met:
1. The number of columns in the two select queries should be same.
2. The data types of the corresponding columns across the two select queries
should be compatible.*/

use school_db;
select * from bridge;
select * from chess;
select * from student;

/*Students who are playing any of the two games or all the students from
bridge table or chess table or both*/
SELECt Id, FullName
FROM Bridge
UNION 
SELECT Id, FullName
FROM Chess;

#table1

select count(*)
from table1; #but table1 doesn't exist in reality 

select count(*)
from (SELECt Id, FullName
FROM Bridge
UNION 
SELECT Id, FullName
FROM Chess) as table1;

select count(*)
from (SELECt Id, FullName
FROM Bridge
UNION 
SELECT Id, FullName
FROM Chess) as temptable;


/*Union ALL - Shows all rows of both the tables. Doesn't remove the duplicate rows.*/
SELECt Id, FullName
FROM Bridge
UNION ALL
SELECT Id, FullName
FROM Chess;

select count(*) noofstudents
from (SELECt Id, FullName
FROM Bridge
UNION ALL
SELECT Id, FullName
FROM Chess) as temptable2;


/*What if the number of columns in two union queries are different*/
Select Id, FullName, BPerformance
FROM Bridge
Union
SELECT Id, FullName, ""
FROM Chess;

/*find those student who only plays chess or bridge game */
select id, fullname
from chess
where id not in (select id from bridge)
union
select id, fullname
from bridge
where id not in (select id from chess);