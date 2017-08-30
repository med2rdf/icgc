sqlplus icgc_user/oracle @01_staging.sql
sqlldr  icgc_user/oracle 02_stating.ctl
sqlplus icgc_user/oracle @03_rdfview.sql
--sqlplus icgc_user/oracle @04_export.sql
--sqlplus icgc_user/oracle @05_spool.sql > /dev/null
