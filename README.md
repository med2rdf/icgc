linked-icgc
===========

### Install Git
    sudo yum -y install git

### Clone this repository
    cd $HOME  
    git clone https://github.com/ryotas/linked-icgc_22

### Install MySQL 
    sudo yum -y install php php-mbstring mysql-server php-mysql
    sudo service mysqld start
    sudo mysql
    SET PASSWORD FOR root@localhost=PASSWORD('p');
    exit

### Install Virtuoso  



### Get virtuoso.sh
    cd $HOME
    wget https://raw.githubusercontent.com/dbcls/rdfsummit/master/virtuoso/virtuoso.sh

### Install Node.js



### Install SPARQL client
    cd $HOME
    git clone https://github.com/ryotas/sparql-gateway.git
    cd sparql-gateway
    npm install request fs config

### Get Project List
    # Download the projecct list into ./input/ from https://dcc.icgc.org/projects/details
    sh 00_projects.tsv ./input/projects_2016_09_20_11_54_43.tsv ./input/projects.tsv

### Download ICGC data  
    vi ./input/project.txt          # list projects
    vi 10_download.sh ./input/projects.txt

### Convert ICGC data into RDF 
    vi 20_convert.sh ./input/projects.txt

