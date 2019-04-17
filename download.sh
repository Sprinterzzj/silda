#!/bin/bash
# Script that downloads all the SILDa related data

RED='\033[0;31m'
END='\033[0m'
echo ">> ${RED}Warning:${END} A total of around 60GB data will be downloaded\n"
mkdir -p "./data/silda-dataset/"

# Download patches
wget -v -O cp1 -L https://imperialcollegelondon.box.com/shared/static/xwgr52mzn9t569zsoa307o2kzb4yvcuy
wget -v -O cp2 -L https://imperialcollegelondon.box.com/shared/static/bcy32z91hiusjqtr4cfqbp0rwnzjvjn8
wget -v -O cp3 -L https://imperialcollegelondon.box.com/shared/static/s822i4717vjr6r7wjmbqtuerec2auwpy
wget -v -O cp4 -L https://imperialcollegelondon.box.com/shared/static/dsd03q1r6oydlg3wrtptp4v4264ladel
cat cp* > patches.h5
mv patches.h5 ./data/silda-dataset/
rm cp1 cp2 cp3 cp4

# Download main SILDa images
wget -v -O im1 -L https://imperialcollegelondon.box.com/shared/static/ce2kkt0j4uir9tpzcxx55lhfr05bbjx9
wget -v -O im2 -L https://imperialcollegelondon.box.com/shared/static/j4rx03ymwajz98wsfgbocrurwjq4l68h
cat im* > silda-images.tgz
tar xvzf silda-images.tgz
mv silda-images ./data/silda-dataset/
rm im1 im2
rm silda-images.tgz
