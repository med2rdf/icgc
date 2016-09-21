linked-icgc
===========

### Install Git
    $ sudo yum -y install git

### Clone this repository
    $ cd $HOME  
    $ git clone https://github.com/ryotas/linked-icgc_22

### Install MySQL 
    $ sudo yum -y install php php-mbstring mysql-server php-mysql
    $ sudo service mysqld start
    $ sudo mysql
    $ SET PASSWORD FOR root@localhost=PASSWORD('p');
    $ exit

### Install Virtuoso  
    $ sudo yum install gcc openssl-devel
    $ sudo yum install aclocal autoconf autoheader automake glibtoolize bison flex gperf 
    # Get download link from https://github.com/openlink/virtuoso-opensource/releases
    $ wget https://github.com/openlink/virtuoso-opensource/releases/download/v7.2.4.2/virtuoso-opensource-7.2.4.2.tar.gz
    $ cd virtuoso-opensource-7.2.4.2
    $ sudo mkdir -p /opt/virtuoso
    $ chown ec2-user:ec2-user /opt/virtuoso
    $ ./configure --prefix=/opt/virtuoso
    $ make
    $ make install

### Get virtuoso.sh
    $ cd $HOME
    $ wget https://raw.githubusercontent.com/dbcls/rdfsummit/master/virtuoso/virtuoso.sh

### Configure Virtuoso
    $ ~/virtuoso.sh edit
    ;; Uncomment next two lines if there is 16 GB system memory free
    NumberOfBuffers          = 1360000
    MaxDirtyBuffers          = 1000000
    ;
    ;NumberOfBuffers          = 10000
    ;MaxDirtyBuffers          = 6000
    DirsAllowed = ., /opt/virtuoso/share/virtuoso/vad, /home/ec2-user/data, /home/ec2-user/data/linked-icgc_22
    ;
    ;MaxQueryCostEstimationTime     = 400   ; in seconds
    MaxQueryExecutionTime           = 6000  ; in seconds

### Install Node.js
    $ mkdir ~/node
    $ cd ~/node
    $ wget https://nodejs.org/dist/v4.5.0/node-v4.5.0-linux-x64.tar.xz
    $ tar node-v4.5.0-linux-x64.tar.xz
    $ export PATH=$PAHT:/home/ec2-user/node/node-v4.5.0-linux-x64/bin

### Install SPARQL client
    $ cd $HOME
    $ git clone https://github.com/ryotas/sparql-gateway.git
    $ cd ~/sparql-gateway
    $ npm install request fs config js-yaml
    # Set the host ip of the server
    $ cd ~/linked-icgc_22
    $ vi config/default.json

### Install D2RQ
    $ mkdir ~/d2rq
    $ cd ~/d2rq
    $ wget https://github.com/downloads/d2rq/d2rq/d2rq-0.8.1.tar.gz
    $ tar xvzf d2rq-0.8.1.tar.gz

### Get Project List
    # Download the projecct list into ./data/ from https://dcc.icgc.org/projects/details
    $ sh 00_projects.tsv ./data/projects_2016_09_20_11_54_43.tsv ./input/projects.tsv

### Download ICGC data  
    $ sh 10_download.sh ./input/projects.txt

### Convert ICGC data into RDF 
    $ sh 20_convert.sh ./input/projects.txt

### Load N-Triple data into Virtuoso
    $ sh 30_load.sh

### Generate additional triples
    $ sh 40_construct.sh 
    
### Dump the graph into one file
    # Copy and paste the script in dump_one_graph.sql in isql console
    $ ./virtuoso.sh isql
    $ sh 50_dump_graph.sh

### More details

Refer [Togo Wiki](http://wiki.lifesciencedb.jp/mw/%E3%81%8C%E3%82%93%E3%82%B2%E3%83%8E%E3%83%A0#Linked_ICGC_.EF.BC.88.E3.83.87.E3.83.BC.E3.82.BF.E7.94.9F.E6.88.90.EF.BC.89.E3.81.AE.E6.89.8B.E9.A0.86)
