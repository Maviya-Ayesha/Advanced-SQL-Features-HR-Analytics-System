-- 1. Scalar Subquery: Get the employee(s) with the maximum salary
SELECT eno, ename, salary
FROM emp_demo
WHERE salary = (SELECT MAX(salary) FROM emp_demo);

-- 2. IN Subquery: List employees who belong to departments that exist in dept_demo
SELECT ename, dept
FROM emp_demo
WHERE dept IN (SELECT dname FROM dept_demo);

-- 3. NOT IN Subquery: List employees whose departments are not present in dept_demo
SELECT ename, dept
FROM emp_demo
WHERE dept NOT IN (SELECT dname FROM dept_demo);

-- 4. Correlated Subquery: Show employees whose salary is above the average of their own department
SELECT e1.ename, e1.salary, e1.dept
FROM emp_demo e1
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM emp_demo e2
    WHERE e1.dept = e2.dept
);

-- 5. EXISTS: List employees who have attendance records
SELECT e.eno, e.ename
FROM emp_demo e
WHERE EXISTS (
    SELECT 1
    FROM emp_attendance a
    WHERE a.eno = e.eno
);

-- 6. NOT EXISTS: List employees who do not have attendance records
SELECT e.eno, e.ename
FROM emp_demo e
WHERE NOT EXISTS (
    SELECT 1
    FROM emp_attendance a
    WHERE a.eno = e.eno
);

-- 7. Nested Subquery with JOIN: List employees with attendance below course average
SELECT e.ename, a.present_days, a.total_days
FROM emp_demo e
JOIN emp_attendance a ON e.eno = a.eno
WHERE (a.present_days * 100.0 / a.total_days) <
(
    SELECT AVG(present_days * 100.0 / total_days)
    FROM emp_attendance
);

-- 8. Subquery in SELECT: Show employee and their attendance percentage
SELECT 
    e.ename,
    (SELECT ROUND(a.present_days * 100.0 / a.total_days, 2)
     FROM emp_attendance a
     WHERE a.eno = e.eno) AS attendance_percent
FROM emp_demo e;
