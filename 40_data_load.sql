PROMPT ===============================================================
PROMPT Starting 40_data_load.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
PROMPT ===============================================================

-- =====================================================================
-- DATA LOAD
-- =====================================================================
ALTER SESSION ENABLE PARALLEL DML;

INSERT /*+ APPEND PARALLEL("GD"."CIM_OFM_SMG3_LOGGING_NEW", 32) */
INTO   "GD"."CIM_OFM_SMG3_LOGGING_NEW"
(
  TRACE_ID,
  ALIAS,
  AUDIT_CREATE_DATE,
  SMG3_LOGGING_DATA,
  FILTRATION_JSON_DATA
)
SELECT /*+ PARALLEL("GD"."CIM_OFM_SMG3_LOGGING", 32) */
  TRACE_ID,
  ALIAS,
  AUDIT_CREATE_DATE,
  SMG3_LOGGING_DATA,
  FILTRATION_JSON_DATA
FROM "GD"."CIM_OFM_SMG3_LOGGING";

COMMIT;

ALTER SESSION DISABLE PARALLEL DML;

PROMPT ===============================================================
PROMPT Ending 40_data_load.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
PROMPT ===============================================================
