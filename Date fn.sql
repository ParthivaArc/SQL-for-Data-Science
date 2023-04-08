/*Converts the date stored as text into date format.
Used Y because the date is in yyyy format.
Use small case y if the year is given in two digits*/

SELECT FullName, DOB, str_to_date(substr(dob,1,10), '%d-%m-%Y') as NewDOB
FROM Student;

/*The following script will do the following:
1. Add a new datetime column NewDOB into the student table
2. Extract the date which is stored as text in the DOB column
3. Convert that date (stored as text) into datetime by using Str_To_Date function
4. Update the date of birth data in the NewDOB column as datetime type so that we could use this data to find students' age*/

Alter table student add column NewDOB datetime; /*Adds a NewDOB column into the student tablke*/

/*Updates the NewDOB column's data*/
Update student
Set NewDOB = Str_to_date(substr(dob,1,10),'%d-%m-%Y');

select * from student;

alter table student
drop column DOB;

/*You may get a Safe Update error while running the above Update query without the where condition.alter
Please go to Edit -> Preferences -> SQL Editor -> Go at the end of the screen, and un-check the Safe updates.
After doing this, you'll have to save and close MySQL (all the tabs). Then re-launch and then run.
*/


								/*Common Date Functions*/

SELECT FullName, DateDiff(Current_date(), NewDOB) as AgeinDays
FROM student;

SELECT FullNAme, NewDOB, Day(NewDOB) as Dy,
Month(NewDOB) as Mth, Year(NewDOB) as Yr,
WeekDay(NewDOB) as WkDay, DayName(NewDOB) as WkDayNameinString
FROM Student;

SELECT FullName, WeekDay(NewDOB) as WkDayinNumeric,
DayName(NewDOB) as WkDayName, Month(NewDOB) as mthInNo, MonthName(NewDOB) as MthName
FROM Student;

SELECT FullName, TimeStampDiff(Month, NewDOB, Current_Date()) as AgeInMonths
FROM Student;
