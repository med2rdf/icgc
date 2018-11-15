ICGC RDF
=======================

## Download Data

    $ sh 01_projects.sh projects_2018_02_14_10_50_42.tsv

## Generate RDF Data


```

git clone https://github.com/med2rdf/icgc.git

docker run
  --name oracle \
  -p 1521:1521 \
  -e ORACLE_PWD=Welcome1 \
  -v $PWD/icgc:/opt/icgc \
  oracle/database:12.2.0.1-ee

docker exec -it oracle sqlplus sys/Welcome1@ORCLPDB1 as sysdba @/opt/icgc/scripts/setup.sql

docker exec -it oracle sqlplus sys/Welcome1@ORCLPDB1 as sysdba @/opt/icgc/scripts/00_user.sql

docker exec -it oracle sh /opt/icgc/scripts/00_run.sh download/projects.tsv

```
