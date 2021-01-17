#!/bin/bash

cd libs/sferes2
./waf clean

rm modules.conf
cd modules
rm cvt_map_elites



cd ../../../

rm -rf install
