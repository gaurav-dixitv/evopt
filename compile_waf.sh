#!/bin/bash

mkdir install

# experiments
cd libs/sferes2/exp
ln -s ../../../experiments/sferes
cd ../../../

# modules
cd  libs/sferes2/modules
ln -s ../../cvt_map_elites
cd ../../../

echo "cvt_map_elites" >> libs/sferes2/modules.conf

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
