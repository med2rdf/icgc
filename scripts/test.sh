#!/bin/sh

date

export SCRIPT_HOME=$(cd $(dirname $0); pwd)

echo ""
echo "******************"
echo "Creating tables .."
echo "******************"

cd $SCRIPT_HOME
while read line; do
  if [[ $line != "#"* ]] && [[ $line != "code"* ]]
  then
    export PROJECT_CODE=`echo $line | cut -f 1 -d " "`
    echo ""
    echo "****************************"
    echo "Loading $PROJECT_CODE data.."
    echo "****************************"

    cat test.sql | sed "s/<project_code>/$PROJECT_CODE/" > test.sql.tmp
    cat test.sql.tmp | docker exec -i virtuoso_docker_test isql | grep "^COUNT" 
    rm test.sql.tmp
  fi
done < $1

date
