-- 1. UNION: Employees and department HODs by name
SELECT ename FROM employee4
UNION
SELECT hod FROM department4;

-- 2. INTERSECT: Employees who are also department HODs
SELECT ename FROM employee4
INTERSECT
SELECT hod FROM department4;

-- 3. EXCEPT: Employees who are not department HODs
SELECT ename FROM employee4
EXCEPT
SELECT hod FROM department4;

-- 4. UNION with JOIN: Combine employee and project names
SELECT e.ename AS person FROM employee4 e
JOIN works_on4 w ON e.empid = w.empid
UNION
SELECT p.pname FROM project4 p;

-- 5. EXCEPT with filter: Employees in IT dept not in Leave Tracker project
SELECT e.empid, e.ename FROM employee4 e
WHERE deptno = 20
EXCEPT
SELECT w.empid, e.ename FROM works_on4 w
JOIN employee4 e ON e.empid = w.empid
WHERE pno = 2;

-- 6. INTERSECT with JOIN: Emp working on Leave Tracker and in IT dept
SELECT e.empid, e.ename FROM employee4 e
JOIN works_on4 w ON e.empid = w.empid
WHERE w.pno = 2
INTERSECT
SELECT empid, ename FROM employee4 WHERE deptno = 20;
