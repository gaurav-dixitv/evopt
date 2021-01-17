#!/bin/bash

mkdir install


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
