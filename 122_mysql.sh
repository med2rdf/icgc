#!/bin/bash
cd ./input/$1
pwd
mysql -u root -pp < ./../../sql/mysql/00_database.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/01_table_project.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/02_table_donor.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/03_table_specimen.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/04_table_sample.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/05_table_ssm.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/11_load_project.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/12_load_donor.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/13_load_specimen.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/14_load_sample.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/15_load_ssm.sql
#mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/21_donor.sql
#mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/22_specimen.sql
#mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/23_analyzed_sample.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/24_ssm_mutation.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/25_ssm_detection.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/26_ssm_effect.sql
mysql -u linked_icgc -pp -D linked_icgc < ./../../sql/mysql/31_index.sql
cd ../../
