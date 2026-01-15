-- =====================================================================
-- Master runner: executes migration scripts in correct order
-- Usage (sqlplus):  @00_master_run.sql
-- =====================================================================
SET ECHO ON
SET FEEDBACK ON
SET LINESIZE 500
SET DEFINE OFF
SET SERVEROUTPUT ON SIZE UNLIMITED
WHENEVER SQLERROR EXIT SQL.SQLCODE

SPOOL 001_OM_CREATE_GD_CIM_OFM_SMG3_LOGGING_&DATE._&TIME..log

ALTER SESSION FORCE PARALLEL DDL   PARALLEL 32;
ALTER SESSION FORCE PARALLEL QUERY PARALLEL 32;
ALTER SESSION FORCE PARALLEL DML   PARALLEL 32;

PROMPT ===============================================================
PROMPT Starting 00_master_run.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
PROMPT ===============================================================

PROMPT >>> Calling 10_create_table.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
@10_create_table.sql

PROMPT >>> Calling 20_create_indexes.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
@20_create_indexes.sql

PROMPT >>> Calling 30_grants.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
@30_grants.sql

PROMPT >>> Calling 40_data_load.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
@40_data_load.sql

PROMPT >>> Calling 50_swap.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
@50_swap.sql

ALTER SESSION DISABLE PARALLEL DDL;
ALTER SESSION DISABLE PARALLEL QUERY;
ALTER SESSION DISABLE PARALLEL DML;

PROMPT ===============================================================
PROMPT Ending 00_master_run.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
PROMPT ===============================================================

SPOOL OFF
