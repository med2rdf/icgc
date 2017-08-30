#!/bin/bash

release="release_25"

if [ -d ./input/$1 ]; then

  echo "Directory $1 already exists. Downloading will be skipped."

else

  echo "Downloading $1..."

  mkdir ./input/$1
  cd ./input/$1
  pwd

  wget -O donor.tsv.gz    https://dcc.icgc.org/api/v1/download?fn=/$release/Projects/$1/donor.$1.tsv.gz
  wget -O specimen.tsv.gz https://dcc.icgc.org/api/v1/download?fn=/$release/Projects/$1/specimen.$1.tsv.gz
  wget -O sample.tsv.gz   https://dcc.icgc.org/api/v1/download?fn=/$release/Projects/$1/sample.$1.tsv.gz
  wget -O ssm.tsv.gz      https://dcc.icgc.org/api/v1/download?fn=/$release/Projects/$1/simple_somatic_mutation.open.$1.tsv.gz

  #mv *donor.$1.tsv.gz donor.tsv.gz
  #mv *specimen.$1.tsv.gz specimen.tsv.gz
  #mv *sample.$1.tsv.gz sample.tsv.gz
  #mv *simple_somatic_mutation.open.$1.tsv.gz ssm.tsv.gz

  gunzip donor.tsv.gz
  gunzip specimen.tsv.gz
  gunzip sample.tsv.gz
  gunzip ssm.tsv.gz
  
  awk '{ if (NR==1) { print $0; }}' < ../projects.tsv > project.tsv
  awk '{ if ($1=="'${1}'") { print $0; }}' < ../projects.tsv >> project.tsv
  
  cd ../../

fi