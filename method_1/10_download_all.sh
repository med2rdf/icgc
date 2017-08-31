#!/bin/bash

while read line; do
  if [[ $line != "#"* ]]
  then
    echo $line
    project_code=`echo $line | cut -f 1`
    echo $project_code
    sh ./021_download.sh $project_code
  fi
done < $1