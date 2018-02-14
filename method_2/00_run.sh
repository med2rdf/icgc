#!/bin/sh

export SCRIPT_HOME=$(cd $(dirname $0); pwd)

echo ""
echo "******************"
echo "Creating tables .."
echo "******************"

cd $SCRIPT_HOME/table
sqlplus icgc_user/oracle@orclpdb1 @00_run.sql

echo ""
echo "***************************"
echo "Setting up R2RML mapping .."
echo "***************************"

cd $SCRIPT_HOME/normalize # For creating tables before verifing r2rml
sh 00_run.sh

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
      echo ""
      echo "****************************"
      echo "Loading $project_code data.."
      echo "****************************"

      cd $SCRIPT_HOME/input/$project_code
      sh $SCRIPT_HOME/load/00_run.sh
      
      cd $SCRIPT_HOME/normalize # For re-creating tables and loading data
      sh 00_run.sh

      echo ""
      echo "****************************"
      echo "Exporting $project_code.nt.."
      echo "****************************"

      cd $SCRIPT_HOME/output
      sqlplus icgc_user/oracle@orclpdb1 @$SCRIPT_HOME/r2rml/05_spool.sql > /dev/null
      mv export.nt $project_code.nt && gzip $project_code.nt
    fi
  fi
done < $1
