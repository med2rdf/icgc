#!/bin/bash
#
# $ sh 02_download_all.sh projects.tsv

while read line; do
  if [[ $line != "#"* ]] && [[ $line != "code"* ]]
  then
    echo $line
    project_code=`echo $line | cut -f 1`
    echo $project_code
    sh ./download.sh $project_code
  fi
done < $1
