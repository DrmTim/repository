SELECT * FROM base
WHERE NOT val = 'String'; -- <> !=

SELECT DISTINCT col AS Columns
FROM base
ORDER BY 1
LIMIT 10; -- FETCH FIRST 10 ROWS ONLY;

SELECT ename, hiredate FROM EMP
WHERE ENAME IN ('FORD', 'SMITH', 'ALLEN', 'WARD', 'MARTIN')

SELECT ename, hiredate FROM EMP
WHERE ENAME NOT IN ('FORD', 'SMITH', 'ALLEN', 'WARD', 'MARTIN')

SELECT * from emp
where hiredate between '05/01/1981' and '12/09/1982'

SELECT * from emp
where SAL NOT BETWEEN 950 AND 1600

SELECT * FROM EMP
WHERE COMM IS NOT NULL;

SELECT * FROM EMP
WHERE JOB LIKE 'S%'

SELECT ENAME || ' makes $' || SAL || ' per month' AS "Salaries of employees"
From EMP;

ORDER BY SAL DESC
ORDER BY DEPTNO, SAL

SELECT count(*), job
FROM emp
GROUP BY job
HAVING count(*) = 2

SELECT *
FROM emp INNER JOIN dept --CROSS JOIN, NATURAL JOIN, USING()
ON emp.deptno = dept.deptno

SELECT e.*, d.*
FROM (select * from dept) d LEFT OUTER JOIN (select * from emp where job = 'SALESMAN') e
ON e.deptno = d.deptno

DESCRIBE emp; --Oracle
net start mysql80
-vmargs -Xmx4096m
"C:\Program Files\DBeaver\dbeaver.exe" -nl en -vmargs -Xmx4096m
