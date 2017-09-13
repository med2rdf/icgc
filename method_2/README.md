## Testing Scripts

    $ sh 00_run.sh project.txt

## Running Oracle Database on Docker Container

Go to the following page and register.

https://store.docker.com/images/oracle-database-enterprise-edition

    $ sudo apt-get install docker.io

    $ sudo docker login
    
    $ sudo docker pull store/oracle/database-enterprise:12.2.0.1
    
    $ vi db_env.dat
    DB_PASSWD=oracle
    DB_BUNDLE=high

    $ sudo docker run -p 1521:1521 -p 5500:5500 -it --name oracle --shm-size="4g" -e DB_PASSWD=oracle store/oracle/database-enterprise:12.2.0.1

    $ sudo docker exec -u oracle -it oracle /bin/bash

To delete the container:

    $ sudo docker stop oracle && sudo docker rm oracle
