#!/bin/bash

date

echo -e "\n\nLoading icgc..."
time ~/virtuoso.sh loaddir http://icgc.link/release_22 ~/data *.nt
echo -e "\n\nLoading hgnc..."
time ~/virtuoso.sh loaddir http://icgc.link/release_22 ~/data hgnc_complete_set.nq.gz
echo -e "\n\nLoading uniprot..."
time ~/virtuoso.sh loaddir http://purl.uniprot.org/ ~/data 9606.ttl
#echo -e "\n\nLoading reactome..."
#time ~/virtuoso.sh loaddir http://purl.uniprot.org/ ~/data Homo_sapiens.owl

date
