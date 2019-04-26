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


depth=`expr $depth + 1`
py_script=my_tree.py  # you have to change this into your location

pwd

# ver. 3
find . | sort | awk -F'/' -v "depth=$depth" '{
  for(i=1;i<=depth;i++){
    if(i!=1){
      printf "/";
    }
    printf $i;
    if(i+1>NF){
      break;
    }
  }
  print ""
}' | uniq | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g' | $py_script


### old versions ###

# ver. 1: 
# find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g' | awk -F'|' '{
#     bar_num = NF-1;
#     for (i=1; i<=bar_num-1; i++){
#         printf "|  ";
#     }
#     print "|" $(NF);
# }'

# ver. 2: 
#find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g' | $py_script
