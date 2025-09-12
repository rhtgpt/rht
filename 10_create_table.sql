PROMPT ===============================================================
PROMPT Starting 10_create_table.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
PROMPT ===============================================================

-- =====================================================================
-- DDL: Create NEW table
-- =====================================================================
CREATE TABLE "GD"."CIM_OFM_SMG3_LOGGING_NEW"
(
  TRACE_ID              VARCHAR2(36 BYTE),
  ALIAS                 VARCHAR2(16 BYTE),
  AUDIT_CREATE_DATE     TIMESTAMP(6) DEFAULT SYSTIMESTAMP,
  SMG3_LOGGING_DATA     CLOB,
  FILTRATION_JSON_DATA  CLOB
)
PARTITION BY RANGE (AUDIT_CREATE_DATE)
  INTERVAL (NUMTODSINTERVAL(1,'DAY'))
SUBPARTITION BY HASH (TRACE_ID)
SUBPARTITION TEMPLATE
(
  SUBPARTITION sp0
    LOB (SMG3_LOGGING_DATA)     STORE AS smg3_logging_data_1 (TABLESPACE GD_LOB_03),
    LOB (FILTRATION_JSON_DATA)  STORE AS smg3_logging_data_2 (TABLESPACE GD_LOB_04),

  SUBPARTITION sp1
    LOB (SMG3_LOGGING_DATA)     STORE AS smg3_logging_data_3 (TABLESPACE GD_LOB_04),
    LOB (FILTRATION_JSON_DATA)  STORE AS smg3_logging_data_4 (TABLESPACE GD_LOB_03)
)
(
  PARTITION p_seed VALUES LESS THAN (DATE '2025-01-01')
)
ENABLE ROW MOVEMENT;

PROMPT ===============================================================
PROMPT Ending 10_create_table.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
PROMPT ===============================================================
