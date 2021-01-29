#!/bin/bash

mkdir install

# experiments
cd libs/sferes2/exp
ln -s ../../../experiments/sferes
ln -s ../../../experiments/rovers
cd ../../../

# modules
cd  libs/sferes2/modules
ln -s ../../cvt_map_elites
ln -s ../../nn2
cd ../../../

echo "cvt_map_elites" >> libs/sferes2/modules.conf
echo "nn2" >> libs/sferes2/modules.conf

INSTALL="$(realpath ./install)"
echo "Install directory: ${INSTALL}"


# compile sferes
cd libs/sferes2
./waf configure --cpp14=yes
./waf -v


# compile experiments
# 1. sferes test
./waf configure --cpp14=yes --exp sferes
./waf --exp sferes
#2. rovers test
./waf configure --cpp17=yes --exp rovers
./waf --exp rovers -v
