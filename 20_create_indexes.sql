PROMPT ===============================================================
PROMPT Starting 20_create_indexes.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
PROMPT ===============================================================

-- =====================================================================
-- INDEXES
-- =====================================================================
CREATE INDEX "GD"."CIM_OFM_SMG3_LOGGING_IX1_NEW"
  ON "GD"."CIM_OFM_SMG3_LOGGING_NEW" ("TRACE_ID","ALIAS")
  REVERSE
  LOCAL
  TABLESPACE "OMIE_IDX";

PROMPT ===============================================================
PROMPT Ending 20_create_indexes.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
PROMPT ===============================================================
