#!/bin/sh
#
# File format of "Summary" data is different from other data e.g. simple_somatic_mutation.aggregated.vcf.gz
# So for now, we do not use "Summary" data
#

release="release_22"

if [ -d ./input/Summary ]; then

  echo "Directory Summary already exists. Downloading will be skipped."

else

  echo "#"
  echo "# Downloading ..."
  echo "#"

  mkdir ./input/Summary
  cd ./input/Summary

  echo "#"
  echo "# Current Directory is `pwd`"
  echo "#"

  wget --no-check-certificate https://dcc.icgc.org/api/v1/download?fn=/$release/Summary/donor.all_projects.tsv.gz
  wget --no-check-certificate https://dcc.icgc.org/api/v1/download?fn=/$release/Summary/donor_exposure.all_projects.tsv.gz
  wget --no-check-certificate https://dcc.icgc.org/api/v1/download?fn=/$release/Summary/donor_family.all_projects.tsv.gz
  wget --no-check-certificate https://dcc.icgc.org/api/v1/download?fn=/$release/Summary/donor_therapy.all_projects.tsv.gz
  wget --no-check-certificate https://dcc.icgc.org/api/v1/download?fn=/$release/Summary/sample.all_projects.tsv.gz
  wget --no-check-certificate https://dcc.icgc.org/api/v1/download?fn=/$release/Summary/simple_somatic_mutation.aggregated.vcf.gz
  wget --no-check-certificate https://dcc.icgc.org/api/v1/download?fn=/$release/Summary/specimen.all_projects.tsv.gz

  mv *donor.all_projects.tsv.gz donor.all_projects.tsv.gz
  mv *donor_exposure.all_projects.tsv.gz donor_exposure.all_projects.tsv.gz
  mv *donor_family.all_projects.tsv.gz donor_family.all_projects.tsv.gz
  mv *donor_therapy.all_projects.tsv.gz donor_therapy.all_projects.tsv.gz
  mv *sample.all_projects.tsv.gz sample.all_projects.tsv.gz
  mv *simple_somatic_mutation.aggregated.vcf.gz simple_somatic_mutation.aggregated.vcf.gz
  mv *specimen.all_projects.tsv.gz specimen.all_projects.tsv.gz

  gunzip *.gz
 
fi
