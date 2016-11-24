#!/bin/sh

#echo -e "\n\nRemove and restart database..."
#~/virtuoso.sh stop
#sleep 2
#~/virtuoso.sh clear
#sleep 2
#~/virtuoso.sh start
#~/virtuoso.sh log
#sleep 15

date

echo -e "\n\nLoading all ICGC data..."
time ~/virtuoso.sh loaddir http://icgc.link/release_22 ./ license.nt
time ~/virtuoso.sh loaddir http://icgc.link/release_22 /home/ec2-user/linked-icgc_22/output ICGC*.nt

date

