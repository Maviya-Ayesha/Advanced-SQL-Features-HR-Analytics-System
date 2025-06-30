-- emp_demo: Active Employees
INSERT INTO emp_demo (eno, ename, designation, salary, dept) VALUES
(101, 'Ayesha Khan', 'Manager', 85000, 'HR'),
(102, 'Ravi Mehra', 'Analyst', 60000, 'IT'),
(103, 'Nikita Roy', 'Developer', 55000, 'IT'),
(104, 'Zara Hussain', 'HR Officer', 50000, 'HR');

-- dept_demo: Departments
INSERT INTO dept_demo (dname, hod_name) VALUES
('HR', 'Ayesha Khan'),
('IT', 'Ravi Mehra'),
('Finance', 'Shoaib Akhtar');

-- emp_archive: Previously Removed Employees
INSERT INTO emp_archive (eno, ename, salary) VALUES
(201, 'Fatima Sheikh', 45000),
(202, 'Adnan Qureshi', 47000);

-- emp_attendance: For Subquery Testing
INSERT INTO emp_attendance (eno, total_days, present_days) VALUES
(101, 90, 85),
(102, 90, 75),
(103, 85, 70),
(104, 88, 83);
