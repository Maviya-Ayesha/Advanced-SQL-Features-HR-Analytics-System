-- Employee table
CREATE TABLE employee4 (
  empid INT PRIMARY KEY,
  ename VARCHAR(30),
  designation VARCHAR(30),
  salary NUMERIC(8,2),
  deptno INT,
  doj DATE
);

-- Department table
CREATE TABLE department4 (
  deptno INT PRIMARY KEY,
  dname VARCHAR(30),
  hod VARCHAR(30)
);

-- Project table
CREATE TABLE project4 (
  pno INT PRIMARY KEY,
  pname VARCHAR(40),
  client_name VARCHAR(40),
  no_of_emp INT
);

-- Works_on table
CREATE TABLE works_on4 (
  empid INT,
  pno INT,
  role VARCHAR(20),
  PRIMARY KEY (empid, pno),
  FOREIGN KEY (empid) REFERENCES employee4(empid),
  FOREIGN KEY (pno) REFERENCES project4(pno)
);

-- Salary table
CREATE TABLE salary4 (
  empid INT,
  month VARCHAR(10),
  basic NUMERIC(8,2),
  hra NUMERIC(8,2),
  da NUMERIC(8,2),
  deduction NUMERIC(8,2),
  total NUMERIC(10,2),
  FOREIGN KEY (empid) REFERENCES employee4(empid)
);
