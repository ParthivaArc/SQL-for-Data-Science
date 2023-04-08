/* List me all the employee who belongs either from ny, nj or la */
select *
from employee
where city = "NY" or city ="NJ" or city = "LA";

select *
from employee
where city in ("NY", "NJ", "LA"); /* here we can use both cahr or numeric dtype */


/* between */
select *
from employee
where salary between 2000 and 5000; /*for between we need to use only numeric dtype*/


SELECT EMPNO, ENAME, HIRE_DATE 
FROM EMP 
WHERE ENAME='JONES' OR ENAME='TURNER' OR ENAME='SMITH';

select empno, ename, hire_date
from emp
where ename in ("Jones", "Turner", "Smith");