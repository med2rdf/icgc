#!/bin/sh

export SCRIPT_HOME=$(cd $(dirname $0); pwd)

echo ""
echo "******************"
echo "Creating tables .."
echo "******************"

cd $SCRIPT_HOME/table
sqlplus icgc_user/oracle@orclpdb1 @00_run.sql

echo ""
echo "************************************"
echo "Creating additional (empty) tables.."
echo "************************************"

cd $SCRIPT_HOME/normalize # For creating tables before verifing r2rml
sh 00_run.sh

echo ""
echo "***************************"
echo "Setting up R2RML mapping .."
echo "***************************"

cd $SCRIPT_HOME/r2rml
sh 00_run.sh

cd $SCRIPT_HOME
while read line; do
  if [[ $line != "#"* ]]
  then
    export PROJECT_CODE=`echo $line | cut -f 1`
    if [[ $PROJECT_CODE == "code" ]]; then
      echo ""
    #elif [[ -f ./output/$PROJECT_CODE.nt ]]; then
    # echo "File ./output/$PROJECT_CODE.nt exists. Skipped."
    else 
      echo ""
      echo "****************************"
      echo "Loading $PROJECT_CODE data.."
      echo "****************************"

      cd $SCRIPT_HOME/input/$PROJECT_CODE
      sh $SCRIPT_HOME/load/00_run.sh
      
      cd $SCRIPT_HOME/normalize # For re-creating tables and loading data
      sh 00_run.sh

      echo ""
      echo "****************************"
      echo "Exporting $PROJECT_CODE.nt.."
      echo "****************************"

      cd $SCRIPT_HOME/output
      sqlplus icgc_user/oracle@orclpdb1 @$SCRIPT_HOME/r2rml/05_spool.sql > /dev/null
      mv export.nt $PROJECT_CODE.nt && gzip $PROJECT_CODE.nt
    fi
  fi
done < $1
