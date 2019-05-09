#!/bin/bash

## usage ##
# tree               : lists the files in the current directory
# tree [dir]         : lists the files in [dir]
# tree [dir] [depth] : [depth] means max display depth of the directory tree 

depth=10

if [ $# -eq 2 ]; then
    if [ -d $1 ]; then
	cd $1
    fi
    if [ $2 -ge 1 ]; then
	depth=$2
    fi
elif [ $# -eq 1 ]; then
    if [ -d $1 ]; then
	cd $1
    fi
elif [ $# -ne 0 ]; then
    echo "Error: The argument is a directory [.] and depth [10]"
    exit 1
fi

py_script=/home/kksnd924/util/my_tree.py

pwd

# ver. 4: Expedited displaying when shallow depth
find . -maxdepth $depth | sort | uniq | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g' | $py_script


### old versions ###

# ver. 1: Visually improved using awk
# find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g' | awk -F'|' '{
#     bar_num = NF-1;
#     for (i=1; i<=bar_num-1; i++){
#         printf "|  ";
#     }
#     print "|" $(NF);
# }'

# ver. 2: Display like original tree using python script
#find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g' | $py_script

# ver. 3: Made it possible to specify depth
# depth=`expr $depth + 1`
# find . | sort | awk -F'/' -v "depth=$depth" '{
#   for(i=1;i<=depth;i++){
#     if(i!=1){
#       printf "/";
#     }
#     printf $i;
#     if(i+1>NF){
#       break;
#     }
#   }
#   print ""
# }' | uniq | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g' | $py_script
