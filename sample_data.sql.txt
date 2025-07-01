-- Departments
INSERT INTO department4 VALUES
(10, 'HR', 'Fatima Sheikh'),
(20, 'IT', 'Adil Khan'),
(30, 'Finance', 'Zehra Ali');

-- Employees
INSERT INTO employee4 VALUES
(101, 'Fatima Sheikh', 'Manager', 85000, 10, '2020-01-10'),
(102, 'Adil Khan', 'Analyst', 62000, 20, '2021-03-15'),
(103, 'Zehra Ali', 'Developer', 58000, 20, '2022-05-01'),
(104, 'Sameer Mirza', 'Clerk', 40000, 30, '2023-02-01'),
(105, 'Rehana Syed', 'Developer', 60000, 20, '2022-10-10');

-- Projects
INSERT INTO project4 VALUES
(1, 'Payroll System', 'BHEL', NULL),
(2, 'Leave Tracker', 'NTPC', NULL),
(3, 'Inventory App', 'DRDO', NULL);

-- Works_on
INSERT INTO works_on4 VALUES
(101, 1, 'Lead'),
(102, 2, 'Developer'),
(103, 2, 'Support'),
(104, 3, 'Tester'),
(105, 3, 'Developer');

-- Salary
INSERT INTO salary4 VALUES
(101, 'Jan', 60000, 10000, 5000, 3000, 72000),
(102, 'Jan', 52000, 8000, 4000, 2500, 61500),
(103, 'Jan', 50000, 7500, 3500, 2000, 59000),
(104, 'Jan', 35000, 6000, 3000, 1000, 43000),
(105, 'Jan', 55000, 8500, 4000, 2200, 65300);
