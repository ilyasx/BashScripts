#!/bin/bash

#system update 
sudo apt-get update
#system upgdate
sudo apt-get -y upgrade

# install dependencies
sudo apt-get -y install libcurl4-openssl-dev libncurses5-dev pkg-config automake yasm
#install github for cloning
sudo apt-get -y install git
#install make 
sudo apt-get -y install make

# clone cpuminer
git clone https://github.com/lucasjones/cpuminer-multi.git

# compile
cd cpuminer-*
./autogen.sh
./configure CFLAGS="-O3"
make

#echo username
echo "Enter pool username here: (eg.abc.xyz) :"
#input username
read username

#echo password
echo "Enter pool password here :"
#input password
read password
# choose a miner pool and register there

#echo url
echo "Enter pool url here: (without stratum+tcp:// but enter port) "
#input url
read url

# start the miner
#script start
./minerd -o stratum+tcp://$url --userpass=$username:$password;


