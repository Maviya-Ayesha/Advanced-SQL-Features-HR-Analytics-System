-- 1. Scalar subquery: Employees with salary > avg salary
SELECT empid, ename, salary
FROM employee4
WHERE salary > (SELECT AVG(salary) FROM employee4);

-- 2. Correlated subquery: Highest salary per department
SELECT e1.empid, e1.ename, e1.salary, e1.deptno
FROM employee4 e1
WHERE salary = (
  SELECT MAX(e2.salary)
  FROM employee4 e2
  WHERE e2.deptno = e1.deptno
);

-- 3. IN subquery: Employees working on at least one project
SELECT empid, ename
FROM employee4
WHERE empid IN (SELECT empid FROM works_on4);

-- 4. NOT IN subquery: Employees not assigned to any project
SELECT empid, ename
FROM employee4
WHERE empid NOT IN (SELECT empid FROM works_on4);

-- 5. EXISTS: Employees who have received salary
SELECT empid, ename
FROM employee4 e
WHERE EXISTS (
  SELECT 1 FROM salary4 s WHERE s.empid = e.empid
);

-- 6. NOT EXISTS: Employees who didn’t receive salary
SELECT empid, ename
FROM employee4 e
WHERE NOT EXISTS (
  SELECT 1 FROM salary4 s WHERE s.empid = e.empid
);

-- 7. Nested subquery in SELECT: Show total salary components
SELECT empid, ename,
  (SELECT basic + hra + da - deduction FROM salary4 s WHERE s.empid = e.empid) AS calculated_total
FROM employee4 e;

-- 8. Multi-level subquery: Projects where >1 employee is assigned
SELECT pname
FROM project4
WHERE pno IN (
  SELECT pno
  FROM works_on4
  GROUP BY pno
  HAVING COUNT(*) > 1
);
