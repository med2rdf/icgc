mkdir -p $SCRIPT_HOME/../log/$PROJECT_CODE
sqlldr icgc_user/oracle@xepdb1 $SCRIPT_HOME/load/11_project.ctl  $SCRIPT_HOME/../log/$PROJECT_CODE/11_project.log
sqlldr icgc_user/oracle@xepdb1 $SCRIPT_HOME/load/12_donor.ctl    $SCRIPT_HOME/../log/$PROJECT_CODE/12_donor.log
sqlldr icgc_user/oracle@xepdb1 $SCRIPT_HOME/load/13_specimen.ctl $SCRIPT_HOME/../log/$PROJECT_CODE/13_specimen.log
sqlldr icgc_user/oracle@xepdb1 $SCRIPT_HOME/load/14_sample.ctl   $SCRIPT_HOME/../log/$PROJECT_CODE/14_sample.log
sqlldr icgc_user/oracle@xepdb1 $SCRIPT_HOME/load/15_ssm.ctl      $SCRIPT_HOME/../log/$PROJECT_CODE/15_ssm.log
