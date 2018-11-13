sqlplus icgc_user/oracle@orclpdb1 @01_staging.sql
sqlldr  icgc_user/oracle@orclpdb1 02_stating.ctl
sqlplus icgc_user/oracle@orclpdb1 @03_rdfview.sql
#sqlplus icgc_user/oracle @04_export.sql
#sqlplus icgc_user/oracle @05_spool.sql > /dev/null
