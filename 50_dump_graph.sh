#/bin/sh!
cd /opt/virtuoso/var/lib/virtuoso/db
echo -e "dump_one_graph ('http://icgc.link/release_22','./data_',50000000000);\n" | sh ~/virtuoso.sh isql 
ls -lat | head
