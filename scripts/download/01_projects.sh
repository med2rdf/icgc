#!/bin/bash
# This script modify projects.tsv, which can be obtained from the original ICGC portal.
#
# sh 00_projects.sh projects_2016_09_20_11_54_43.tsv

echo "code	name	primary_site	tumour_type	tumour_subtype	countries" > projects.tsv

cat $1 | \
awk 'BEGIN {FS="\t"; OFS="\t"} NR>1 {print $1, $2, $3, "", "", $4}' >> projects.tsv
