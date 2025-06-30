-- 1. UNION with JOINs: List all employee names and their departments from emp_demo
-- and archived employees along with a placeholder department
SELECT e.eno, e.ename, e.salary, d.dname
FROM emp_demo e
JOIN dept_demo d ON e.dept = d.dname

UNION

SELECT a.eno, a.ename, a.salary, 'Archived' AS dname
FROM emp_archive a;

-- 2. INTERSECT: Find employees (by eno and salary) who exist in both emp_demo and archive
-- This means they were re-added with the same salary
SELECT e.eno, e.salary
FROM emp_demo e
JOIN dept_demo d ON e.dept = d.dname

INTERSECT

SELECT a.eno, a.salary
FROM emp_archive a;

-- 3. EXCEPT: List employees from IT department who are currently active but not archived
SELECT e.eno, e.ename, e.salary
FROM emp_demo e
JOIN dept_demo d ON e.dept = d.dname
WHERE d.dname = 'IT'

EXCEPT

SELECT a.eno, a.ename, a.salary
FROM emp_archive a;

-- 4. UNION with filter: Combine current and archived employees earning above 50,000
SELECT eno, ename, salary
FROM emp_demo
WHERE salary > 50000

UNION

SELECT eno, ename, salary
FROM emp_archive
WHERE salary > 50000;

-- 5. EXCEPT with nested JOIN: Show active employees whose salary doesn’t match any archived record
SELECT e.eno, e.ename, e.salary
FROM emp_demo e
LEFT JOIN emp_archive a ON e.salary = a.salary
WHERE a.salary IS NULL

EXCEPT

SELECT a.eno, a.ename, a.salary
FROM emp_archive a;

-- 6. INTERSECT using JOIN and department: Find employees who are both in HR and also archived
SELECT e.eno, e.ename
FROM emp_demo e
JOIN dept_demo d ON e.dept = d.dname
WHERE d.dname = 'HR'

INTERSECT

SELECT a.eno, a.ename
FROM emp_archive a;
