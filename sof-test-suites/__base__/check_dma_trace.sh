#!/bin/bash
PASSED_INFO=""
FAILED_INFO=""

__TEMP_CHECK_LOG=rmbox.log

function __case_passed
{
    rm -rf $__TEMP_CHECK_LOG
}

function __case_failed
{
    rm -rf $__TEMP_CHECK_LOG
}

function __execute
{
    logi 'check dma trace ...'
    sudo rmbox -t > $__TEMP_CHECK_LOG & sleep 2 ; pkill -9 rmbox$
    size=`du -k rmbox.log |awk '{print $1}'`
    [[ $size -gt 1 ]] && return 0 || return 1
}
