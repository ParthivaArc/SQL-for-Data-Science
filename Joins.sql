/*Joins Concept and Script
Why? -
To fetch information from more than one interrelated tables.
Eg: Say you've a customer_Table and orders_Table.
You want to get the list of all the orders made by each customer

The following IN query will not work as it only allows the data from the outer most to be
extracted.
SELECT custID, custName
FROM Customer_table
WHERE custID IN (SELECT custID from Order);

Students' names and type of musical instruments they play.
SELECT ID, FullName
FROM Student
WHERE ID IN (SELECT ID FROM Music)

*Intersection / INNER / Natural / Equi Joins*:
This is same as finding the common rows on the basis of
common columns between two or more joined tables.
Eg: Customer and Orders Tables. You want to find the list
of orders placed by each customer.
(3) SELECT Student.SID, Name, CName
(1) FROM Student, Course
(2) WHERE Student.SID = Course.SID

*/

/*Other way of writing Joins is to use Join Keywords like:
INNER JOIN
LeftJoin
RightJoin
FullJoin (may or may not work in all the databases)*/


/* Students' names and type of musical instruments they play. */
/*INNER JOIN or Intersection Join*/
select * from student;
select * from music;

/* First way of writing inner join */
SELECT m.Id, fullName, Type
FROM Student as s, Music as m
WHERE s.Id = m.id; 

/* Second of writing inner join */
SELECT s.Id, FullName, Type
FROM Student as s INNER JOIN Music as M On S.Id = M.ID; 


/*Loan & FD Example
Highest Risk Customers - Only Loan -> NOT IN
Lowest risk Customers - Only FD - NOT IN
Medium Risk Customers - Both - Two Options:
a) IN
b) INNER JOIN (natural join)

Highest Risk Customers - Only Loan -> NOT IN
SELECT * FROM LoanTable WHERE CustID NOT IN (SELECT custID FROM FDTable);
here not needed to use join since we needed output from only one table

Lowest risk Customers - Only FD - NOT IN
SELECT * FROM FDTable WHERE CustID NOT IN (SELECT custID FROM LoanTable);

Medium Risk Customers - Both - You want to list the customers and amount of loan and FD they have.
INNER JOIN because we need data from both the tables.

SELECT f.custID, custName, LoanAmt, FDAmt
FROM FDTable as f, LoanTable as l
WHERE f.custID = l.custID;

SELECT f.custID, custName, LoanAmt, FDAmt
FROM FDTable as f, LoanTable as l
WHERE f.custID = l.custID
UNION
SELECT custID, custName, ""
FROM FDTable WHERE CustID NOT IN (SELECT custID FROM LoanTable);;
*/

/*Outer Joins using Keywords*/
/*Left Join*/
SELECT s.Id, fullName, Type
FROM Student as S, Music as M
WHERE s.ID = m.ID
Union
SELECT ID, FullName, ""
FROM Student
WHERE ID NOT IN (SELECT ID FROM Music); /* first the common from both tables is shown
then due to union the remaining is also displayed */

/*Assuming Student is on the left hand side of the Venn Diagram*/
SELECT s.ID, FullName, Type
FROM Student as s Left Join Music as M ON s.ID = m.ID;


/*Right Join*/
SELECT s.ID, FullName, Type
FROM Student as s Right Join Music as M ON s.ID = m.ID;

/*Full Join - Left Join Union Right Join
Since there is no keyword for full join so we have to work around with it using left and right join*/
SELECT s.ID, FullName, Type
FROM Student as s LEFT Join Music as M ON s.ID = m.ID
UNION
SELECT s.ID, FullName, Type
FROM Student as s Right Join Music as M ON s.ID = m.ID;

select * from student;

/* Question -> 
student - student info -> id, name, gender...
sports_academy - student, professional player, salaried 

show me all the records of the students who goes or doesn't go to sports academy 
1. inner join 2. left join 3. right join 4. full join

Ans -> requiremnt - student, goes/doesn't from sports -> left join

abhsihek - inner x
saloni - full x
shivani - full x
azeem - full x
*/

