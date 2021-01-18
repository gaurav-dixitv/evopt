#!/bin/bash

cd libs/sferes2
./waf clean

# experiments
cd exp/
rm sferes
rm rovers
cd ..

# modules
rm modules.conf
cd modules
rm cvt_map_elites
cd ..

git checkout -- .
git clean -df
cd ../../

rm -rf install
