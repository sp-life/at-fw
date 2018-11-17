#!/bin/bash

curr=`pwd`

echo $0 $curr
sh=$0
[[ ${sh:0:1} == '.' ]] && {
    echo "full root: " $curr/$sh
    echo `dir $curr/$sh`
}

[[ -f $curr/_init_env ]] && . $curr/_init_env || {
    while [[ -n $curr ]]; do
        curr=${curr%/*}
        [[ -f $curr/_init_env ]] && {
            . $curr/_init_env
            echo "found & set _init_env" $curr/_init_env
            break
        }
        echo $curr
    done
}

# Check capture devices with Audio Legacy
arecord -l |grep "device"> /dev/null
#if [ $? != 0 ]; then
#	echo "Fail: Can not get capture pcm list."
#	exit 1
#else
#   exit 0
#fi


