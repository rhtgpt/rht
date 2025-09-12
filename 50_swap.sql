PROMPT ===============================================================
PROMPT Starting 50_swap.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
PROMPT ===============================================================

-- =====================================================================
-- SWAP (short outage)
-- =====================================================================
ALTER TABLE GD.CIM_OFM_SMG3_LOGGING     RENAME TO CIM_OFM_SMG3_LOGGING_OLD;
ALTER TABLE GD.CIM_OFM_SMG3_LOGGING_NEW RENAME TO CIM_OFM_SMG3_LOGGING;

PROMPT ===============================================================
PROMPT Ending 50_swap.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
PROMPT ===============================================================
