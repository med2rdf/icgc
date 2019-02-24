#!/bin/bash
# This script modify projects.tsv, which can be obtained from the original ICGC portal.
#
# $ sh 01_projects.sh projects_2018_02_14_10_50_42.tsv > projects.tsv

echo "code	name	primary_site	tumour_type	tumour_subtype	countries"

cat $1 | \
awk 'BEGIN {FS="\t"; OFS="\t"} NR>1 {print $1, $2, $3, "", "", $4}'
