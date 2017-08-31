#!/bin/sh

export SCRIPT_HOME=$PWD

sqlplus icgc_user/oracle @$SCRIPT_HOME/table/00_run.sql

cd $SCRIPT_HOME/r2rml
sh 00_run.sh

cd $SCRIPT_HOME
while read line; do
  if [[ $line != "#"* ]]
  then
    project_code=`echo $line | cut -f 1`
    if [[ $project_code == "code" ]]; then
      echo ""
    #elif [[ -f ./output/$project_code.nt ]]; then
    # echo "File ./output/$project_code.nt exists. Skipped."
    else 
      echo "#### $project_code ####"

      cd $SCRIPT_HOME/input/$project_code
      sh $SCRIPT_HOME/load/00_run.sh
      
      cd $SCRIPT_HOME/normalize
      sh 00_run.sh

      cd $SCRIPT_HOME/output
      sqlplus icgc_user/oracle @$SCRIPT_HOME/r2rml/05_spool.sql > /dev/null
      mv export.nt $project_code.nt && gzip $project_code.nt
    fi
  fi
done < $1
