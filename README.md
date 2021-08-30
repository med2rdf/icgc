ICGC RDF
=======================

The aim of this repository is to generate a RDF dataset from the table-format data publicly available at the [ICGC Data Portal](https://dcc.icgc.org/), for better reusability and interoperability in the Semantic Web.

## How to generate RDF data

### Get scripts

* Ubuntu 18.04
* 4GB or more memory capacity is recommended (In AWS, t2.medium has 4GB memory)
* For locating the all RDF datasets along with the original datasets, 250GB disk space is required

### Get scripts

Pull this repository

    $ git clone https://github.com/med2rdf/icgc.git

### Install Docker

Add the OS user to docker group and login again to the console.

    $ sudo groupadd docker
    $ sudo usermod -aG docker $USER
    $ exit

Install docker via apt.

    $ sudo apt-get update
    $ sudo apt install docker.io
    $ sudo systemctl start docker
    $ docker --version
    Docker version 20.10.7, build 20.10.7-0ubuntu1~18.04.1

### Install Oracle Database

Get Dockerfile to build Docker image of Oracle Database.

    $ mkdir oracle
    $ cd oracle
    $ git clone https://github.com/oracle/docker-images.git

Build docker image (needs 4GB memory).

    $ cd ~/oracle/docker-images/OracleDatabase/SingleInstance/dockerfiles/18.4.0/
    $ docker build -t oracle/database:18.4.0-xe -f Dockerfile.xe .

Launch Oracle Database on a docker container.

    $ docker run --name oracle \
      -p 1522:1521 -e ORACLE_PWD=Welcome1 \
      -v $HOME:/host-home \
      oracle/database:18.4.0-xe

Once you got the message below, you can quit with Ctl+C.

    #########################
    DATABASE IS READY TO USE!
    #########################

### Install Oracle Database

Start the conteiner.

    $ docker start oracle

Configure the database as a triplestore.

    $ docker exec -it oracle \
      sqlplus sys/Welcome1@XEPDB1 as sysdba @/host-home/icgc/scripts/setup.sql

Create a user.

    $ docker exec -it oracle \
      sqlplus sys/Welcome1@XEPDB1 as sysdba @/host-home/icgc/scripts/00_user.sql

### Download Data

For downloading the latest project list, access [Data Portal](https://dcc.icgc.org/projects/details), click Available Data Type > SSM, and click "Export Table as TSV" icon.

Create project list: `project.tsv`

    $ cd scripts/download/
    $ bash 01_projects.sh projects_2021_08_23_03_37_00.tsv > projects.tsv

Download test datasets.

    $ bash 02_download_all.sh projects_test.tsv

Download all files. Use `projects_test.tsv` instead for testing.

    $ bash 02_download_all.sh projects.tsv

### Generate RDF Data

Use `projects_test.tsv` for test datasets.

    $ docker exec -it oracle \
      sh /host-home/icgc/scripts/00_run.sh download/projects_test.tsv \
      > ~/icgc/log/main.log

For all datasets.

    $ docker exec -it oracle \
      sh /host-home/icgc/scripts/00_run.sh download/projects.tsv \
      > ~/icgc/log/main.log

## Ontologies

Ontologies referenced

* hco: https://github.com/med2rdf/hco
* med2rdf: https://github.com/med2rdf/med2rdf-ontology
* faldo: https://github.com/OBF/FALDO (genomic positions of mutations)

Guideline

* [DBCLS Guideline](http://wiki.lifesciencedb.jp/mw/RDFizingDatabaseGuideline)
