DECLARE

    v_run VARCHAR2(20 BYTE);
    v_runi VARCHAR2(20) := '&RUN';
    v_pnombre VARCHAR2(15);
    v_snombre VARCHAR2(15);
    v_apppat VARCHAR2(15);
    v_appmat VARCHAR2(15);
    v_sueldo NUMBER(8,0);
    v_sueldoF NUMBER(8,0);
    v_bono NUMBER(8,0);
    v_bonoporcentaje NUMBER(8,2) := 0.15;
    v_nombre VARCHAR2(60);
    
BEGIN

    SELECT med_run || '-' || dv_run, sueldo_base, pnombre, apaterno, amaterno
    INTO v_run, v_sueldo, v_pnombre, v_apppat, v_appmat
    FROM medico
    WHERE med_run || '-' || dv_run = v_runi;
    
    IF v_sueldo < 1000000 THEN
        v_bono := v_sueldo * v_bonoporcentaje;
        v_sueldoF := v_sueldo + v_bono;
    ELSE 
        v_bono := 0;
        v_sueldoF := v_sueldo;
    END IF;
    
    v_nombre := v_pnombre || ' ' || v_apppat || ' ' || v_appmat;
    
    DBMS_OUTPUT.PUT_LINE('--------------------------');
    DBMS_OUTPUT.PUT_LINE('VALOR DE BONIFICACIÓN 15%');
    DBMS_OUTPUT.PUT_LINE('--------------------------');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('RUN medico: ' || v_run);
    DBMS_OUTPUT.PUT_LINE('Nombre medico: ' || v_nombre);
    DBMS_OUTPUT.PUT_LINE('Sueldo: ' || v_sueldo);
    DBMS_OUTPUT.PUT_LINE('Bonificacion extra: ' || v_bono);
    DBMS_OUTPUT.PUT_LINE('Sueldo final: ' || v_sueldoF);
    
EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontro ningún medico con el RUN especificado.');    

END;