
SET SERVEROUTPUT ON;

DECLARE 
v_fname VARCHAR2(25);
BEGIN 
SELECT  first_name INTO v_fname
FROM employees WHERE employee_id = 200;
DBMS_OUTPUT.PUT_LINE('200 employee name is : ' || v_fname);
END;
/

DECLARE
v_emp_hire_date EMPLOYEES.HIRE_DATE%TYPE;
v_emp_salary EMPLOYEES.SALARY%TYPE;
BEGIN
SELECT HIRE_DATE, SALARY INTO v_emp_hire_date,v_emp_salary
FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;
DBMS_OUTPUT.PUT_LINE('employee 100 hiredate : ' || v_emp_hire_date);
DBMS_OUTPUT.PUT_LINE('employee 100 SALARY : ' || v_emp_salary);
END;
/


DECLARE
sal_increase employees.salary%TYPE := 80;
BEGIN
UPDATE employees
SET salary = salary + sal_increase
WHERE job_id = 'ST_CLERK';
dbms_output.put_line(sal_increase);
END;
/
rollback;
SELECT job_id, salary
from employees
WHERE job_id = 'ST_CLERK';


BEGIN
    MERGE INTO copy_emp c
    USING employees e ON ( e.employee_id = c.emp_no )
    WHEN MATCHED THEN UPDATE
    SET c.first_name = e.first_name,
        c.last_name = e.last_name,
        c.email = e.email,
        c.phone_number = e.phone_number,
        c.hire_date = e.hire_date,
        c.job_id = e.job_id,
        c.salary = e.salary,
        c.commission_pct = e.commission_pct,
        c.manager_id = e.manager_id,
        c.department_id = e.department_id
    WHEN NOT MATCHED THEN
    INSERT
    VALUES
        ( 
          e.first_name,
          e.email,
          e.phone_number,
          e.hire_date,
          e.job_id,
          e.salary,
          e.commission_pct,
          e.manager_id,
          e.department_id );

END;
/



CREATE TABLE copy_emp (
    emp_no NUMBER(6),
    first_name VARCHAR2(20),
    last_name VARCHAR2(25),
    email VARCHAR2(25),
    phone_number VARCHAR2(20),
    hire_date DATE,
    job_id VARCHAR2(10),
    salary NUMBER(8, 2),
    commission_pct NUMBER(2, 2),
    manager_id NUMBER(6),
    department_id NUMBER(4)
);
ALTER TABLE copy_emp add constraint emp_no_pk PRIMARY KEY (emp_no);


SELECT * FROM COPY_EMP;
drop table copy_emp;
DESCRIBE COPY_EMP;
DESCRIBE EMPLOYEES;