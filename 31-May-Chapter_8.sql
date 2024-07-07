SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp_cursor2 IS
    SELECT
        department_id,
        department_name
    FROM
        departments
    WHERE
        department_id = 50;

    d_id   departments.department_id%TYPE;
    d_name departments.department_name%TYPE;
BEGIN
    OPEN c_emp_cursor2;
    FETCH c_emp_cursor2 INTO d_id,
    d_name;
    dbms_output.put_line(d_id
                         || ' '
                         || d_name);
END;
/

DECLARE
    CURSOR c_emp_cursor IS
    SELECT
        employee_id,
        last_name
    FROM
        employees
    WHERE
        department_id = 30;

    v_empno employees.employee_id%TYPE;
    v_lname employees.last_name%TYPE;
BEGIN
    OPEN c_emp_cursor;
    loop
    FETCH c_emp_cursor INTO
        v_empno,
        v_lname;
        exit when c_emp_cursor%NOTFOUND;
    dbms_output.put_line(v_empno
                         || ' '
                         || v_lname);
        END LOOP;
END;
/