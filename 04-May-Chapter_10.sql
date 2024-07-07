SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE add_dept IS
v_dept_id dept.dept_id%TYPE;
v_dept_name dept.dept_name%TYPE;
BEGIN
v_dept_id := 20;
v_dept_name := 'St_salesman';
INSERT INTO dept(dept_id, dept_name)
VALUES (v_dept_id, v_dept_name);
DBMS_OUTPUT.PUT_LINE('INSERTED ' || SQL%ROWCOUNT || ' Row');
EXCEPTION 
WHEN DUP_VAL_ON_INDEX THEN
DBMS_OUTPUT.PUT_LINE('Can not insert duplicate value');
END;
/
EXECUTE add_dept;

select dept_id, dept_name from dept;

SELECT object_name, object_type FROM user_objects

commit;

CREATE TABLE dept
(dept_id NUMBER(10) UNIQUE,
dept_name VARCHAR2(255),
est_date DATE );

ALTER TABLE dept ADD UNIQUE (dept_name);

DECLARE 
v_name VARCHAR2(30);
BEGIN
SELECT last_name INTO v_name
FROM employees
WHERE employee_id = 2323;
DELETE FROM dept
WHERE department_id = 503;
IF SQL%NOTFOUND THEN
RAISE_APPLICATION_ERROR(-20034, 'No Rows Deleted');
END IF;
EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR(-20033, 'No Rows Selected');
END;


CREATE OR REPLACE PROCEDURE add_dept
IS 
v_dept_id NUMBER;
BEGIN
SELECT NVL(MAX(dept_id), 0 ) +10 INTO v_dept_id
FROM dept;
INSERT INTO dept(dept_id, dept_name, est_date)
VALUES(v_dept_id, 'Dept-' ||to_char(v_dept_id), sysdate);
EXCEPTION 
WHEN DUP_VAL_ON_INDEX THEN
RAISE_APPLICATION_ERROR(-20037, 'Can not Insert Duplicate Values');
END;
/

EXECUTE add_dept;

SELECT * FROM DEPT;


CREATE OR REPLACE FUNCTION check_salary(p_id NUMBER)
RETURN BOOLEAN IS
v_dept_id employees.department_id%TYPE;
v_empno employees.employee_id%TYPE;
v_sal employees.salary%TYPE;
v_avg_sal employees.salary%TYPE;
BEGIN
v_empno := p_id;
SELECT salary, department_id INTO v_sal , v_dept_id FROM employees
WHERE employee_id = v_empno;
IF v_sal > v_avg_sal THEN
RETURN TRUE;
ELSE
RETURN FALSE;
END IF;
EXCEPTION
WHEN NO_DATA_FOUND THEN
RETURN NULL;
END;

BEGIN IF ( check_salary IS NULL ) THEN
    dbms_output.put_line('The Function Returned NuLL due to exception');
elsif ( check_salary ) THEN
DBMS_OUTPUT.PUT_LINE('SALARY > AVERAGE');
ELSE
DBMS_OUTPUT.PUT_LINE('SALARY < AVERAGE');
END IF;
END;
------------------
BEGIN
IF(check_salary(1100) IS NULL) THEN
DBMS_OUTPUT.PUT_LINE('The function returned null due to exeption');
ELSIF(check_salary(1100)) THEN
dbms_output.put_line('Salary > AVERAGE');
ELSE
DBMS_OUTPUT.PUT_LINE('SALARY < AVERAGE');
END IF;
END;










