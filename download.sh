"""
StarGAN v2
Copyright (c) 2020-present NAVER Corp.
This work is licensed under the Creative Commons Attribution-NonCommercial
4.0 International License. To view a copy of this license, visit
http://creativecommons.org/licenses/by-nc/4.0/ or send a letter to
Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
"""

FILE=$1

if [ $FILE == "pretrained-network-celeba-hq" ]; then
    URL=https://drive.google.com/u/0/uc\?id\=1AglXTyliM7N32UbgkRdZNG8dx-MnV8eJ\&export\=download
    mkdir -p ./expr/checkpoints/celeba_hq
    OUT_FILE=./expr/checkpoints/celeba_hq/100000_nets_ema.ckpt
    gdown -O $OUT_FILE $URL

elif  [ $FILE == "pretrained-network-afhq" ]; then
    URL=https://www.dropbox.com/s/etwm810v25h42sn/100000_nets_ema.ckpt?dl=0
    mkdir -p ./expr/checkpoints/afhq
    OUT_FILE=./expr/checkpoints/afhq/100000_nets_ema.ckpt
    wget -N $URL -O $OUT_FILE
    
elif  [ $FILE == "wing" ]; then
    URL=https://drive.google.com/u/0/uc\?id\=1UWoNMH5yKn4C9Lc1Z-w3ENTKxttHIae5\&export\=download
    mkdir -p ./expr/checkpoints/
    OUT_FILE=./expr/checkpoints/wing.ckpt
    gdown -O $OUT_FILE $URL
    URL=https://drive.google.com/u/0/uc\?id\=1ckRKtva3TF7CkBL0NVsLFTqTB_oSqsIY\&export\=download
    OUT_FILE=./expr/checkpoints/celeba_lm_mean.npz
    gdown -O $OUT_FILE $URL

elif  [ $FILE == "celeba-hq-dataset" ]; then
    # URL=https://www.dropbox.com/s/f7pvjij2xlpff59/celeba_hq.zip?dl=0
    # ZIP_FILE=./data/celeba_hq.zip
    # mkdir -p ./data
    # wget -N $URL -O $ZIP_FILE
    # unzip $ZIP_FILE -d ./data
    # rm $ZIP_FILE

    URL=https://www.dropbox.com/s/f7pvjij2xlpff59/celeba_hq.zip?dl=0
    ZIP_FILE=./dataset/celeba_hq.zip
    # mkdir -p ./dataset
    wget -N $URL -O $ZIP_FILE
    unzip $ZIP_FILE -d ./dataset
    rm $ZIP_FILE


elif  [ $FILE == "afhq-dataset" ]; then
    URL=https://www.dropbox.com/s/t9l9o3vsx2jai3z/afhq.zip?dl=0
    ZIP_FILE=./data/afhq.zip
    mkdir -p ./data
    wget -N $URL -O $ZIP_FILE
    unzip $ZIP_FILE -d ./data
    rm $ZIP_FILE

else
    echo "Available arguments are pretrained-network-celeba-hq, pretrained-network-afhq, celeba-hq-dataset, and afhq-dataset."
    exit 1

fi