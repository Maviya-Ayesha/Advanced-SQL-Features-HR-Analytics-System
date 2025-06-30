-- Employee Table
CREATE TABLE emp_demo (
    eno INT PRIMARY KEY,
    ename VARCHAR(30),
    designation VARCHAR(20),
    salary NUMERIC(8,2),
    dept VARCHAR(30)
);

-- Department Table
CREATE TABLE dept_demo (
    dname VARCHAR(30) PRIMARY KEY,
    hod_name VARCHAR(30)
);

-- Archive Table (used for procedures/demonstration)
CREATE TABLE emp_archive (
    eno INT PRIMARY KEY,
    ename VARCHAR(30),
    salary NUMERIC(8,2)
);

-- Attendance Sample Table (for subqueries)
CREATE TABLE emp_attendance (
    eno INT PRIMARY KEY,
    total_days INT,
    present_days INT
);
