#!/bin/bash
PASSED_INFO=""
FAILED_INFO=""

function __case_passed
{
    __OCCUPY_LINE_DELETE_ME__ #case passed post response
}

function __case_failed
{
    rpt 'DSP firmware were not loaded.'
}

function __execute
{
    dmesg | grep 'firmware boot complete' > /dev/null
    dmesg | grep 'Firmware info' > /dev/null

    local firmware_version=0.9
    vers=`dmesg | grep "FW loaded" |head -1 |grep "version:" |cut -d : -f 4 |cut -c 2-4`

    [[ "$vers" != "$firmware_version" ]] && return 1
    return 0
}
