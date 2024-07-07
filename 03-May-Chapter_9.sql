SET SERVEROUTPUT ON;

DECLARE
v_last_name VARCHAR2(15);
BEGIN
SELECT last_name INTO v_last_name
FROM employees
WHERE first_name = 'Dee';
DBMS_OUTPUT.PUT_LINE('Employee last name is : ' || v_last_name);
EXCEPTION
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('your select statement too many rows selected');
WHEN NO_DATA_FOUND THEN
--DBMS_OUTPUT.PUT_LINE(q'{Data doesn't exist}');
DBMS_OUTPUT.PUT_LINE('Data doesn''t exist');
END;
/

In Primary key You can not insert OR UPDATE null value or duplicate value 

update departments
SET department_name = 'Sales Marketer'
WHERE department_id = 250;
rollback

DECLARE
v_invalid_update EXCEPTION;
PRAGMA EXCEPTION_INIT(v_invalid_update, -01407);
BEGIN
UPDATE departments
SET department_name = null
SET department_name = 'Sales Marketer'
WHERE department_id = 250;
EXCEPTION
WHEN v_invalid_update THEN
DBMS_OUTPUT.PUT_LINE('You cannot update null value in department_name');
DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

rollback
INSERT STATEMENT IN PL/SQL

DECLARE
    v_invalid_insert EXCEPTION;
    PRAGMA exception_init ( v_invalid_insert, -01400 );
BEGIN
    INSERT INTO departments (
        department_id,
        department_name,
        manager_id
    ) VALUES (
        280,
        NULL,
        177
    );

EXCEPTION
    WHEN v_invalid_insert THEN
        dbms_output.put_line('Primary key Violated You can''t insert null value in 
mandatory field');
        dbms_output.put_line(sqlerrm);
END;
/

YOU can create error raise error and YoU cAN hAndLe this 

DECLARE
    v_deptno NUMBER := 500;
    v_name VARCHAR2(20) := 'Testing';
    e_invalid_department EXCEPTION;
BEGIN
UPDATE departments
SET department_name  = v_name
WHERE department_id = v_deptno;
IF SQL%NOTFOUND THEN
RAISE e_invalid_department;
END IF;
EXCEPTION
WHEN e_invalid_department THEN
DBMS_OUTPUT.PUT_LINE('No Such Department id.');
END;
/

















