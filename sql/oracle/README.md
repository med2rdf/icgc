## Running Oracle Database on Docker Container

Go to the following page and register.

https://store.docker.com/images/oracle-database-enterprise-edition

    $ sudo apt-get install docker.io

    $ sudo docker login

    $ docker pull store/oracle/database-enterprise:12.1.0.2

    $ vi db_enf.dat
    DB_PASSWD=oracle
    DB_BUNDLE=high

    $ sudo docker run -d --env-file ./db_env.dat -p 1521:1521 -p 5500:5500 -it --name dockerDB --shm-size="4g" store/oracle/database-enterprise:12.1.0.2

    $ sudo docker exec -u oracle -it dockerDB /bin/bash
