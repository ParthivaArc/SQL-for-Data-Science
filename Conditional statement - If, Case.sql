/*If Statement - When you take an action based on a condition. 
Eg: If someone has scored more than 95 in Mtest, then he / she is 
a scholar, otherwise dumb. */
SELECT FullName, Mtest, If(Mtest > 95, "Scholar", "Dumb") as Status
FROM Student;

SELECT FullName, Mtest,
If(Mtest < 90, "Dumb", If(Mtest between 90 and 95, "Average", "scholar")) as Status
FROM Student;

/*How many scholars and dumbs are there in the table? */
SELECT If(Mtest >95, "Scholar", "Dumb") as Status, Count(*) as Cnt
FROM Student
Group by If(Mtest >95, "Scholar", "Dumb");

/*Case & WHEN*/
SELECT FullName, Mtest, Case 
						WHEN Mtest < 90 THEN "Dumb"
                        WHEN Mtest BETWEEN 90 and 95 THEN "Average"
                        Else "Scholar"
                        END As Status
FROM Student;