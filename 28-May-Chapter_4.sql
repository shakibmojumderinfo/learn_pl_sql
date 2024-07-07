SET SERVEROUTPUT ON;

GROUP FUNCTION ARE NOT AVAILABLE IN PROCEDURAL STATEMENT BUT

DECLARE 
    v_avg_salary NUMBER;
BEGIN 
SELECT AVG(salary)
INTO v_avg_salary
FROM employees
WHERE department_id = 10;

DBMS_OUTPUT.PUT_LINE('The avg salary is :' || v_avg_salary);
END;
/

GET THE LENGTH OF A STRING;

DECLARE
    v_decs_size     INTEGER(5);
    v_get_desc_size VARCHAR(70) := 'You can use this product
with your radios for highier frequencey';
BEGIN
    v_decs_size := length(v_get_desc_size);
    dbms_output.put_line(v_decs_size);
END;
/

USING SEQUENCE IN PL/SQL EXPRESSION

DECLARE
user_seq NUMBER;
BEGIN
user_seq:= my_seq.nextval;   --ERORR
DBMS_OUTPUT.PUT_LINE('The next value of the sequence is: ' || user_seq);
END;
/

DECLARE
user_seq NUMBER;
BEGIN           --eorrorororo
SELECT my_seq.NEXTVAL INTO user_seq FROM DUAL;  --from
DBMS_OUTPUT.PUT_LINE(user_seq);
END;
/

IMPLICIT DATA CONVERSION

DECLARE 
v_salary NUMBER(6) := 6000;
v_sal_IMPLICIT_CONVERSION VARCHAR2(50) := '1000';
v_total_salary v_salary%TYPE; --REFERENCE DATA TYPE;
BEGIN 
v_total_salary := v_sal_IMPLICIT_CONVERSION + v_salary;
DBMS_OUTPUT.PUT_LINE('Total salary is :' || v_total_salary);
END;
/

EXPLICIT DATATYPE CONVERSION IN DATA FUNCTION

DECLARE 
v_date_format DATE;
v_wrong_date_format date := TO_DATE('february 02,2000', 'Month DD, YYYY');
BEGIN
--v_date_format:= (v_wrong_date_format);
--DBMS_OUTPUT.PUT_LINE(v_date_format);
DBMS_OUTPUT.PUT_LINE(v_wrong_date_format); --YOU CAN ALSO DECLARE A VAR WHICH IS ALREADY DECLARED;
END;
/

GLOBAL AND LOCAL VARIABLE;

BEGIN
    << outer >> 
    DECLARE  --global
        v_father_name   VARCHAR2(23) := 'JHON';
        v_date_of_birth DATE := '20-Apr-2070';
        v_message VARCHAR2(255) := 'OUTER OR GLOBAL VAR';
    BEGIN  --global

        DECLARE --local
            v_child_name    VARCHAR2(34) := 'Mike';
            v_date_of_birth DATE := '23-Mar-2020';
            v_message VARCHAR(255) := 'INNER OR Local Var';
        BEGIN  --local
            dbms_output.put_line('Fathers name:' || v_father_name);
            dbms_output.put_line('F - Date of birth :' || outer.v_date_of_birth);
            dbms_output.put_line('Child name :' || v_child_name);
            dbms_output.put_line('C - Date of birth:' || v_date_of_birth); --global
            dbms_output.put_line(outer.v_message);
            dbms_output.put_line(v_message);
--            v_message2 :
        END;
        v_message := 'Real Global var ' || v_message;
        DBMS_OUTPUT.PUT_LINE(v_message);
    END;
END outer;
/

ANOTHER ONE GLOBAL AND LOCAL VARIABLE;

BEGIN << outer >> 
DECLARE
    v_sal  NUMBER(7, 2) := 60000;
    v_comm v_sal%TYPE := v_sal * 0.20;
    v_message VARCHAR2(255) := 'Eiligible for commission';
BEGIN

    DECLARE 
        v_sal NUMBER(7,2) := 50000;
        v_comm v_sal%TYPE := 0;
        v_total_comp NUMBER(7,2) := v_sal + v_comm;
    BEGIN
        v_message := 'Clerk not' || v_message;
        outer.v_comm := v_sal * 0.30;
        
        DBMS_OUTPUT.PUT_LINE('Outer Commission: ' || outer.v_comm);
        DBMS_OUTPUT.PUT_LINE(v_message);
        end;
        v_message := 'SalesMan' || v_message;
        DBMS_OUTPUT.PUT_LINE(v_message);
    END;
END outer;
/


   FROM ACTIVITY GUIDE;
   
   BEGIN
    << outer >> DECLARE
        v_weight  NUMBER(3) := 600;
        v_message VARCHAR2(255) := 'Product 10012';
    BEGIN
        DECLARE
            v_weight   NUMBER(3) := 1;
            v_message  VARCHAR2(255) := 'Product 11001';
            v_new_icon v_message%TYPE := 'Europe';
        BEGIN
            v_weight := v_weight + 1;
            dbms_output.put_line(v_weight);
            v_new_icon := 'Western ' || v_new_icon;
            dbms_output.put_line(v_new_icon);
        END;

        v_message := v_message || 'is in stock';
        dbms_output.put_line(v_message);
        v_new_icon := 'Western ' || v_new_icon;
--   DBMS_OUTPUT.PUT_LINE(v_new_icon);
    END;
END outer;
/

SET SERVEROUTPUT ON;

BEGIN
    <<outer>>
    DECLARE
        v_weight NUMBER(3) := 600;
        v_message VARCHAR2(255) := 'Product 10012';
        v_new_icon VARCHAR2(255); -- Declare in the outer block to use it in both blocks
    BEGIN
        DECLARE
            v_weight NUMBER(3) := 1;
            v_message VARCHAR2(255) := 'Product 11001';
            v_new_icon v_message%TYPE := 'Europe';
        BEGIN
            v_weight := v_weight + 1;
            DBMS_OUTPUT.PUT_LINE(v_weight); -- Output: 2
            v_new_icon := 'Western ' || v_new_icon;
            DBMS_OUTPUT.PUT_LINE(v_new_icon); -- Output: Western Europe
            DBMS_OUTPUT.PUT_LINE(outer.v_weight+1);
            
--        outer.v_comm := v_sal * 0.30;
--        DBMS_OUTPUT.PUT_LINE('Outer Commission: ' || outer.v_comm);

        
        END;
        
        v_message := v_message || ' is in stock';
        DBMS_OUTPUT.PUT_LINE(v_message); -- Output: Product 10012 is in stock
        -- v_new_icon is updated in the inner block and not available in the outer block
--        v_new_icon := 'Western ' || v_new_icon; -- Outer block v_new_icon
--        DBMS_OUTPUT.PUT_LINE(v_new_icon); -- Output: Western null (if not initialized in outer)
    END;
END outer;
/















