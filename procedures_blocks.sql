-- 1. Procedure: Increment salary based on department
CREATE OR REPLACE PROCEDURE sal_inc()
AS $$
BEGIN
  UPDATE employee3 SET salary = salary * 1.15 WHERE dept_no = 5;
  UPDATE employee3 SET salary = salary * 1.10 WHERE dept_no != 5;
END;
$$ LANGUAGE plpgsql;

-- 2. Function: Get max, min, avg salary by department
CREATE OR REPLACE PROCEDURE get_sal(
  p_dno IN INTEGER,
  max_sal OUT NUMERIC,
  min_sal OUT NUMERIC,
  avg_sal OUT NUMERIC
)
AS $$
BEGIN
  SELECT MAX(salary), MIN(salary), AVG(salary)
  INTO max_sal, min_sal, avg_sal
  FROM employee3
  WHERE dept_no = p_dno;
END;
$$ LANGUAGE plpgsql;

-- DO block to call the above procedure for each department
DO $$
DECLARE
  dnum INT;
  max_sal NUMERIC;
  min_sal NUMERIC;
  avg_sal NUMERIC;
BEGIN
  FOR dnum IN SELECT DISTINCT dept_no FROM employee3
  LOOP
    CALL get_sal(dnum, max_sal, min_sal, avg_sal);
    RAISE NOTICE 'Dept: %, Max: %, Min: %, Avg: %', dnum, max_sal, min_sal, avg_sal;
  END LOOP;
END;
$$;

-- 3. Function: Count employees working on a given project
CREATE OR REPLACE FUNCTION proj_count(p_pno INT)
RETURNS INT AS $$
DECLARE
  emp_count INT;
BEGIN
  SELECT COUNT(*) INTO emp_count FROM works_on4 WHERE pno = p_pno;
  RETURN emp_count;
END;
$$ LANGUAGE plpgsql;

-- Update project table using proj_count()
DO $$
DECLARE
  n INT;
BEGIN
  FOR n IN SELECT pno FROM project4
  LOOP
    UPDATE project4 SET no_of_emp = proj_count(n) WHERE pno = n;
  END LOOP;
END;
$$;

-- 4. Procedure: Display DOJ month in words for a given employee
CREATE OR REPLACE PROCEDURE date_proc(p_eno INT)
AS $$
DECLARE
  v_doj DATE;
  mon INT;
  mname VARCHAR(30);
BEGIN
  SELECT doj INTO v_doj FROM employee3 WHERE empno = p_eno;
  mon := EXTRACT(MONTH FROM v_doj);
  CASE mon
    WHEN 1 THEN mname := 'Jan';
    WHEN 2 THEN mname := 'Feb';
    WHEN 3 THEN mname := 'Mar';
    WHEN 4 THEN mname := 'Apr';
    WHEN 5 THEN mname := 'May';
    WHEN 6 THEN mname := 'Jun';
    WHEN 7 THEN mname := 'Jul';
    WHEN 8 THEN mname := 'Aug';
    WHEN 9 THEN mname := 'Sep';
    WHEN 10 THEN mname := 'Oct';
    WHEN 11 THEN mname := 'Nov';
    WHEN 12 THEN mname := 'Dec';
  END CASE;
  RAISE NOTICE 'Employee % joined in %', p_eno, mname;
END;
$$ LANGUAGE plpgsql;

-- 5. Function: Expression calculator using nested POWER function
CREATE OR REPLACE FUNCTION pow_func(x INT, y INT)
RETURNS INT AS $$
DECLARE
  i INT := 1;
  p INT := 1;
BEGIN
  WHILE i <= y LOOP
    p := p * x;
    i := i + 1;
  END LOOP;
  RETURN p;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION exp_func(a INT, b INT)
RETURNS INT AS $$
DECLARE
  p INT;
BEGIN
  p := 2 * pow_func(a, b) + b;
  RETURN p;
END;
$$ LANGUAGE plpgsql;

-- 6. Procedure: Calculate profit percentage with division-by-zero handling
CREATE OR REPLACE PROCEDURE calc_profit(v_pid INT)
AS $$
DECLARE
  v_cp FLOAT;
  v_max_sp FLOAT;
  profit FLOAT;
  p_perc FLOAT;
BEGIN
  SELECT cost_price INTO v_cp FROM product WHERE pid = v_pid;
  SELECT total_selling_amount INTO v_max_sp FROM sales WHERE pid = v_pid;
  IF v_cp = 0 THEN
    RAISE NOTICE 'Cannot divide by zero for product ID %', v_pid;
  ELSE
    profit := v_max_sp - v_cp;
    p_perc := (profit * 100) / v_cp;
    UPDATE product SET max_profit_margin = p_perc WHERE pid = v_pid;
  END IF;
END;
$$ LANGUAGE plpgsql;

-- 7. Function: Update student attendance based on sports and medical leaves
CREATE OR REPLACE FUNCTION update_attendance(p_dno INT)
RETURNS INT AS $$
DECLARE
  v_count INT := 0;
  v_sports_days INT := 0;
  v_medical_days INT := 0;
  v_added_days FLOAT := 0;
  student_rec student2%ROWTYPE;
  c_students CURSOR FOR SELECT * FROM student2 WHERE DNo = p_dno;
BEGIN
  OPEN c_students;
  LOOP
    FETCH c_students INTO student_rec;
    EXIT WHEN NOT FOUND;
    SELECT COALESCE(SUM(No_of_Days), 0) INTO v_medical_days FROM Medical_Leave WHERE student_ID = student_rec.student_ID;
    SELECT COALESCE(SUM(No_of_Days), 0) INTO v_sports_days FROM Sports_Activity WHERE student_ID = student_rec.student_ID;
    v_added_days := 0.3 * (v_medical_days + v_sports_days);
    IF v_added_days > 0 THEN
      UPDATE student2 SET Attendance = Attendance + v_added_days WHERE student_ID = student_rec.student_ID;
      v_count := v_count + 1;
    END IF;
  END LOOP;
  CLOSE c_students;
  RETURN v_count;
END;
$$ LANGUAGE plpgsql;





