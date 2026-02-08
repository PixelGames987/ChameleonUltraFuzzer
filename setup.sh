#!/bin/bash

directory=$(pwd)

sudo apt update
sudo apt install git cmake build-essential python3-pip python3-venv libssl-dev openssl

git clone https://github.com/RfidResearchGroup/ChameleonUltra.git --depth 1
cd ChameleonUltra/software/src
mkdir -p out
cd out
cmake ..
cmake --build . --config Release
cd -
python3 -m venv $directory/ChameleonUltra/software/script/venv
$directory/ChameleonUltra/software/script/venv/bin/python3 -m pip install -r $directory/ChameleonUltra/software/script/requirements.txt
