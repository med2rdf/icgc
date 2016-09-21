#!/bin/sh

#echo -e "\n\nRemove and restart database..."
#~/virtuoso.sh stop
#sleep 2
#~/virtuoso.sh remove
#sleep 2
#~/virtuoso.sh start
#sleep 15

date

echo -e "\n\nLoading all ICGC data..."
time ~/virtuoso.sh loaddir http://icgc.link/release_22 ~/data/ license.nt
time ~/virtuoso.sh loaddir http://icgc.link/release_22 ~/data/linked-icgc_22/ ICGC*.nt

date

