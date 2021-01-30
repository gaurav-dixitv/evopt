#!/bin/bash

print_help()
{
   echo ""
   echo "Usage: $0 -e experiment -c cppversion -x execute"
   echo -e "\t-e name of the experiment to compile."
   echo -e "\t-c cpp version. Valid values are 11, 14, 17."
   echo -e "\t-x (y/N) execute the compiled experiment?"
   echo ""
   exit 1 # Exit script after printing help
}

# parse ops
while getopts "e:c:x:" opt
do
   case "$opt" in
      e ) exp="$OPTARG" ;;
      c ) version="$OPTARG" ;;
      x ) execute="$OPTARG" ;;
      ? ) print_help ;; # invalid opt
   esac
done

# make sure I have everything I need
if [[ -z "$exp" ]] #|| [ -z "$execute" ]
then
   echo "Some or all of the parameters are empty!";
   print_help
fi

# enter experiments dir
cd libs/sferes2

# compile experiment
./waf configure --cpp17=yes --exp $exp
./waf --exp $exp -v

cd ../../

# execute if -x
if [[ ! -z "$execute" ]] ; then
    execute=${execute,,}    # tolower
    if [[ "$execute" =~ ^(yes|y)$ ]] ; then
        ./libs/sferes2/build/exp/$exp/$exp;
    fi
fi
