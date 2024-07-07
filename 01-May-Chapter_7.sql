SET SERVEROUTPUT ON;

DECLARE
    v_my_age NUMBER := 20;
BEGIN
    IF v_my_age <= 20 THEN
        dbms_output.put_line('I am young');
    ELSE
        dbms_output.put_line('I am Older');
    END IF;
END;
/

DECLARE
    a number := 20;
    b number := 15;
    c number := 20;
BEGIN 
IF a >= c THEN
DBMS_OUTPUT.PUT_LINE('A IS EQUAL TO C');
ELSE
DBMS_OUTPUT.PUT_LINE('IF "IF" STATEMENT WRONG THEN I WILL EXECUTE');
END IF;
END;
/

DECLARE 
ab char(1) := UPPER('&grade');
bc varchar2 (20);
BEGIN 
bc := CASE ab 
    WHEN 'A' THEN 'excellent'
    WHEN 'B' THEN 'VERY GOOD'
    WHEN 'c' THEN 'GOOD'
    WHEN 'D' THEN 'BAD'
    ELSE 'NO SUCH RESULT'
    END;
    DBMS_OUTPUT.PUT_LINE('GRADE ' || ab || ' appraisal ' || bc);
    end;
    /
    
DECLARE
v_deptid number;
v_deptname varchar2(20);
v_emps number;
v_mngid number := 108;
begin
case v_mngid
when 108 then
select department_id, department_name into
v_deptid, v_deptname FROM departments
where manager_id = 108;
select count(*) into v_emps FROM employees
where department_id = v_deptid;
end case;
dbms_output.put_line('you are working in the' || v_deptname||
    'department. THERE are ' || v_emps || ' employees in this 
    department');
    end;





