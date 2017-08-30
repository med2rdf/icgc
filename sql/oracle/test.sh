#!/bin/sh

export SCRIPT_HOME=$PWD

while read line; do
  if [[ $line != "#"* ]]
  then
    project_code=`echo $line | cut -f 1`
    if [[ $project_code == "code" ]]; then
      echo ""
    #elif [[ -f ./output/$project_code.nt ]]; then
    #  echo "File ./output/$project_code.nt exists. Skipped."
    else 
      echo "#### $project_code ####"
      cd ../../input/$project_code

      sqlplus icgc_user/oracle @$SCRIPT_HOME/00_tables.sql

      sqlldr icgc_user/oracle $SCRIPT_HOME/11_project.ctl
      sqlldr icgc_user/oracle $SCRIPT_HOME/12_donor.ctl
      sqlldr icgc_user/oracle $SCRIPT_HOME/13_specimen.ctl
      sqlldr icgc_user/oracle $SCRIPT_HOME/14_sample.ctl
      sqlldr icgc_user/oracle $SCRIPT_HOME/15_ssm.ctl

      sqlplus icgc_user/oracle @$SCRIPT_HOME/20_ssm_tables.sql

      sh r2rml/00_run.sh
      sqlplus icgc_user/oracle @05_spool.sql > /dev/null
      tar cvf export.nt -f $project_code.nt.tar.gz

    fi
  fi
done < $1
