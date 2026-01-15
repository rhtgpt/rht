PROMPT ===============================================================
PROMPT Starting 30_grants.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
PROMPT ===============================================================

-- =====================================================================
-- GRANTS
-- =====================================================================
GRANT DELETE ON "GD"."CIM_OFM_SMG3_LOGGING_NEW" TO "GD_APP_ROLE";
GRANT INSERT ON "GD"."CIM_OFM_SMG3_LOGGING_NEW" TO "GD_APP_ROLE";
GRANT SELECT ON "GD"."CIM_OFM_SMG3_LOGGING_NEW" TO "GD_APP_ROLE";
GRANT UPDATE ON "GD"."CIM_OFM_SMG3_LOGGING_NEW" TO "GD_APP_ROLE";
GRANT SELECT ON "GD"."CIM_OFM_SMG3_LOGGING_NEW" TO "GD_VIEW_ROLE";

PROMPT ===============================================================
PROMPT Ending 30_grants.sql at:
BEGIN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP,'YYYY-MM-DD HH24:MI:SS.FF3 TZH:TZM'));
END;
/
PROMPT ===============================================================
