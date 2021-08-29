sqlplus icgc_user/oracle@xepdb1 @01_staging.sql
sqlldr  icgc_user/oracle@xepdb1 02_staging.ctl log=../../log/02_stating.log
sqlplus icgc_user/oracle@xepdb1 @03_rdfview.sql
#sqlplus icgc_user/oracle @04_export.sql
#sqlplus icgc_user/oracle @05_spool.sql > /dev/null
