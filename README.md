## Advanced SQL Features – HR & Analytics System (PostgreSQL Project)

This project demonstrates mastery of advanced SQL concepts including set operations, subqueries, PL/pgSQL blocks, exception handling, and procedures. Built using PostgreSQL and pgAdmin, it simulates real-world employee and HR record analytics.

Tools & Environment
- PostgreSQL (pgAdmin)
- SQL (DDL, DML, PL/pgSQL)
- Features: SET functions, Subqueries, Procedures, Exception Handling, Cursors

Project Structure
- schema.sql – Table definitions: emp_demo, emp_archive, dept_demo, emp_attendance
- sample_data.sql – Sample records using real names from previous coursework
- set_queries.sql – UNION, INTERSECT, EXCEPT (with JOINs, filters, logic)
- subqueries.sql – Scalar, correlated, EXISTS, NOT EXISTS, nested joins
- procedures_blocks.sql – Procedures, DO blocks, IF-ELSE, exception handling, cursors

Highlights
- Cursor-controlled attendance reporting with % calculations
- Archive logic for low-salary employees with exception trap
- JOIN-based set functions (e.g., EXCEPT between joined sets)
- Complex subqueries using AVG, filters, department-level comparisons
- Reusable procedures for salary updates and safe inserts

Sample Logic Demonstrated
- Archive & retain employee data with controlled cleanup
- Departmental salary audits
- Attendance reporting with filters and analytics
- Use of PL/pgSQL for robust HR operations

Author
Maviya Ayesha  
Jamia Millia Islamia — M.Sc. Mathematics with Computer Science  
SQL Developer Portfolio Project – 2025
