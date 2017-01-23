linked-icgc
===========

## Setup

### Install Git
    $ sudo yum -y install git

### Clone this repository
    $ cd $HOME  
    $ git clone https://github.com/ryotas/linked-icgc
    $ git checkout release_23.01

### Install MySQL 

Install MySQL.

    $ sudo yum -y install php php-mbstring mysql-server php-mysql
    $ sudo service mysqld start
    $ sudo mysql
    $ SET PASSWORD FOR root@localhost=PASSWORD('p');
    $ exit

Configure buffer_pool_size.

    $ sudo vi /etc/my.cnf
    innodb_buffer_pool_size = 2G
    $ sudo service mysqld restart

### Install Virtuoso

    $ sudo yum -y install gcc openssl-devel
    $ sudo yum -y install aclocal autoconf autoheader automake glibtoolize bison flex gperf 
    # Get download link from https://github.com/openlink/virtuoso-opensource/releases
    $ wget https://github.com/openlink/virtuoso-opensource/releases/download/v7.2.4.2/virtuoso-opensource-7.2.4.2.tar.gz
    $ tar xvzf virtuoso-opensource-7.2.4.2
    $ cd virtuoso-opensource-7.2.4.2
    $ sudo mkdir -p /opt/virtuoso
    $ sudo chown ec2-user:ec2-user /opt/virtuoso
    $ ./configure --prefix=/opt/virtuoso
    $ make
    $ make install

Get virtuoso.sh.

    $ cd ~
    $ wget https://raw.githubusercontent.com/dbcls/rdfsummit/master/virtuoso/virtuoso.sh

Configure Virtuoso for 1 GB system memory (assuming AWS micro instance).

    $ sh virtuoso.sh edit
    ;NumberOfBuffers          = 10000
    ;MaxDirtyBuffers          = 6000
    NumberOfBuffers          = 80000
    MaxDirtyBuffers          = 60000
    DirsAllowed = ., /opt/virtuoso/share/virtuoso/vad, /home/ec2-user/data
    ;
    ;MaxQueryCostEstimationTime     = 400   ; in seconds
    ;MaxQueryExecutionTime          = 60    ; in seconds
    MaxQueryExecutionTime           = 6000  ; in seconds

### Install Node.js
    $ mkdir ~/node
    $ cd ~/node
    $ wget https://nodejs.org/dist/v6.9.4/node-v6.9.4-linux-x64.tar.xz
    $ tar xvJf node-v6.9.4-linux-x64.tar.xz
    $ export PATH=$PATH:$HOME/node/node-v6.9.4-linux-x64/bin

### Install SPARQL client
    $ cd ~
    $ git clone https://github.com/ryotas/sparql-gateway.git
    $ cd ~/sparql-gateway
    $ npm install request fs config forever express body-parser mongoose
    # Set the host ip of the server
    $ vi config/default.json

### Install D2RQ
    $ mkdir ~/d2rq
    $ cd ~/d2rq
    $ wget https://github.com/downloads/d2rq/d2rq/d2rq-0.8.1.tar.gz
    $ tar xvzf d2rq-0.8.1.tar.gz

### Install Portal
    $ sudo service httpd start
    $ cd /var/www/html
    $ sudo chown ec2-user:ec2-user /var/www/html
    $ git clone https://github.com/ryotas/linked-icgc-portal.git
    $ vi linked-icgc-portal/js/endpoint.js
    var endpoint = 'http://<global_ip>:9001/sparql';

## Data Generation

### Get Project List

    # Download the projecct list into ./data/ from https://dcc.icgc.org/projects/details
    $ sh 00_projects.tsv ./data/projects_2016_09_20_11_54_43.tsv ./input/projects.tsv

### Download ICGC data  

    $ sh 10_download.sh ./input/projects.txt

### Convert ICGC data into RDF 

    $ sudo service mysqld start
    $ sh 20_convert.sh ./input/projects.txt

### Load N-Triple data into Virtuoso

    $ ~/virtuoso.sh stop
    $ ~/virtuoso.sh clear
    $ ~/virtuoso.sh start
    $ sh 30_load.sh

### Generate additional triples

This script issues a CONSTRUCT query and generate a file (/data/x-gene.nt).

    $ sh 40_construct.sh 
    
### Dump the graph into one file

    # Copy and paste the script in dump_one_graph.sql in isql console
    $ ./virtuoso.sh isql
    $ sh 50_dump_graph.sh

## Portal

Start Virtuoso.

    $ ~/virtuoso.sh start

Download external datasets to be linked.

    $ cd ~/data
    $ wget http://download.bio2rdf.org/release/3/hgnc/hgnc_complete_set.nq.gz

Load data.

    $ sh 60_load_all.sh

Start web server.

    $ sudo service httpd start

## For More Details

Refer [Togo Wiki](http://wiki.lifesciencedb.jp/mw/%E3%81%8C%E3%82%93%E3%82%B2%E3%83%8E%E3%83%A0#Linked_ICGC_.EF.BC.88.E3.83.87.E3.83.BC.E3.82.BF.E7.94.9F.E6.88.90.EF.BC.89.E3.81.AE.E6.89.8B.E9.A0.86)
