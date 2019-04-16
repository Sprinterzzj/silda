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
rm cp*
