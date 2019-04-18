#!/bin/bash
# Script that downloads all the SILDa related data

RED='\033[0;31m'
END='\033[0m'
echo ">> ${RED}Warning:${END} A total of around 60GB data will be downloaded\n"
sleep 5
mkdir -p "./data/SILDa/"

# Download patches
echo ">> Downloading local patches\n"
wget -O cp1 -L https://imperialcollegelondon.box.com/shared/static/xwgr52mzn9t569zsoa307o2kzb4yvcuy
wget -O cp2 -L https://imperialcollegelondon.box.com/shared/static/bcy32z91hiusjqtr4cfqbp0rwnzjvjn8
wget -O cp3 -L https://imperialcollegelondon.box.com/shared/static/s822i4717vjr6r7wjmbqtuerec2auwpy
wget -O cp4 -L https://imperialcollegelondon.box.com/shared/static/dsd03q1r6oydlg3wrtptp4v4264ladel
cat cp* > patches.h5
mv patches.h5 ./data/SILDa/
rm cp1 cp2 cp3 cp4

# Download main SILDa images
echo ">> Downloading full spherical images\n"
wget -O im1 -L https://imperialcollegelondon.box.com/shared/static/ce2kkt0j4uir9tpzcxx55lhfr05bbjx9
wget -O im2 -L https://imperialcollegelondon.box.com/shared/static/j4rx03ymwajz98wsfgbocrurwjq4l68h
cat im* > silda-images.tgz
tar xvzf silda-images.tgz
mv silda-images ./data/SILDa/
rm im1 im2
rm silda-images.tgz

# Download intrinsics
echo ">> Downloading camera intrinsics\n"
wget -O camera-intrinsics.tar.xz -L https://imperialcollegelondon.box.com/shared/static/pug92l2sw2n375eqrqo92j63p5qm5dqo.xz
tar xf camera-intrinsics.tar.xz
mv camera-intrinsics ./data/SILDa/
rm camera-intrinsics.tar.xz

# Download image tags
echo ">> Downloading image tags\n"
wget -O tags.tar.gz -L https://imperialcollegelondon.box.com/shared/static/6suq8u5kky6ch4ue2zow9vrllu9nwqp7.gz
tar xzf tags.tar.gz
mv tags ./data/SILDa/
rm tags.tar.gz

# Download camera poses for the train images
echo ">> Downloading camera poses\n"
wget -O silda-train-poses.txt -L https://imperialcollegelondon.box.com/shared/static/jr67j3uw8sz97j4vw8la3j3vbhzfwpnz.txt
mv silda-train-poses.txt ./data/SILDa/

# Download train and test images split
echo ">> Downloading train/test split\n"
wget -O train_imgs.txt -L https://imperialcollegelondon.box.com/shared/static/m71jx5h09heygzttn85v96z6ouz03dbv.txt
mv train_imgs.txt ./data/SILDa/
wget -O query_imgs.txt -L https://imperialcollegelondon.box.com/shared/static/hfa2l5lw86asskjv6efp8lvoipc8elc8.txt
mv query_imgs.txt ./data/SILDa/

# Download building labels for the classification task
echo ">> Downloading building labels\n"
wget -O train_buildings.txt -L https://imperialcollegelondon.box.com/shared/static/4se8wwf03an0892roupnrsxr4042jlo1.txt
mv train_buildings.txt ./data/SILDa/

# Download pairs for the image matching task
echo ">> Downloading pairs for the image matching task\n"
wget -O image-matching-task-pairs.txt -L https://imperialcollegelondon.box.com/shared/static/n593cepzsr448yp9nnh9mhrs4gkfcn8z.txt
mv image-matching-task-pairs.txt ./data/SILDa/
