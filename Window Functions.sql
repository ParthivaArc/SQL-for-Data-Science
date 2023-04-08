/*Window functions - divide the data into smaller sets and compute. 
How? 
wind_func() over (partition by <expression> Order by <expression>)
Why?
- Rank of different students in each class
- nth (eg - 2nd highest / 3rd highest) Highest scorer in each class
- S.No. of students*/

/*Queries on Rank, Dense_Rank, Row_Number*/
/*Rank, Dense Rank and Row_Number across the entire table
Rank() - Gives you the normal rank, where if two people share the same score, 
they also share the rank. They will also absorb the ranks.
Dense_rank() - Gives you the nth highest person information. 
Eg - Within each class, what is the rank of students*/

Use school_db;

/* overall rank in the table */
SELECT FullName, Mtest, Rank() Over (Order By Mtest DESC) as Rnk,
					dense_rank() Over (Order By Mtest DESC) as DRank,
                    Row_number() over (Order By Mtest DESC) as SNo
FROM Student; 


/* 1. Rank() - I want to find the rank
 2. Over - Rank on the basis / criteria of 
 3. (Order By Mtest DESC) - basis / criteria 
 
 Meaning - I want to find the rank on the basis of desc mtest marks*/


/* classwise rank */
SELECT FullName, Mtest, class, Rank() Over (partition by class order By Mtest DESC) as Rnk,
					dense_rank() Over (partition by class Order By Mtest DESC) as DRank,
                    Row_number() over (partition by class Order By Mtest DESC) as RowNo
FROM Student; 

select fullname, class
from student
group by class;

/* 1. Rank() - I want to find the rank
 2. Over - Rank on the basis / criteria of 
 3. (Partition by class Order By Mtest DESC) - basis / criteria 
 
 Meaning - I want to find the rank on the basis of desc mtest marks but class wise*/


/* Task - What is students' rank in each class based on ptest marks*/
SELECT FullName, Class, Mtest, Rank() Over (partition by class Order By Mtest DESC)
FROM Student;

/* Summary */
SELECT FullName, Class, Mtest, Rank() Over (Order By Mtest DESC) as Rnk, 
Rank() Over (partition by class Order By Mtest DESC) as ClassWiseRank, 
dense_rank() over (Order By Mtest DESC) as nThHighest,
Dense_Rank() Over (partition by class Order By Mtest DESC) as ClassWiseHighestScorer,
row_number() over (Order By Mtest DESC) as Row_Num
FROM Student
Order by Class;


/*Name of the second highest scorer in Maths*/

SELECT FullName, Mtest, dense_rank() over (Order By Mtest DESC) as nThHighestScorer
FROM Student
WHERE nThHighestScorer = 2; /* error- coz nthHighestscore is not defined until we store it in some table */


SELECT FullName, Mtest
FROM (
SELECT FullName, Mtest, dense_rank() over (Order By Mtest DESC) as nThHighestScorer
FROM Student) as table1
WHERE nthHighestScorer = 2;


SELECT FullName, Mtest, dense_rank() over (Order By Mtest DESC) as nThHighestScorer
FROM Student;


SELECT FullName, Mtest, dense_rank() over (Order By Mtest DESC) as nThHighestScorer
FROM Student
where nthHighestscorer =2;

select * from student;

SELECT FullName, Mtest, dense_rank() over (Order By Mtest DESC) as nThHighestScorer
FROM Student;

select * from student
where class = "1a";


/* Pattern matching and window fn*/
/*List the ranks within class 1 (instead of 1A, 1B, 1C)*/
SELECt FullName, Class, Mtest, Rank() over (order by mtest desc)
FROM Student
WHERE Class Like "1_";

/*Agg fn and window function
Total of Mtest Score as cummulative total for each student
in each class*/
Select FullName, Class, Mtest, 
Sum(Mtest) Over (partition by class order by mtest) as CummTotal, /*Cumulative total = Running total */
sum(mtest) over (partition by class) as ClassTotal,
Mtest / (Sum(Mtest) over (partition by class))
from student
Where class is not null;