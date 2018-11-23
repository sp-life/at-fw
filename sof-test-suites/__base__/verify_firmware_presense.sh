#!/bin/bash
PASSED_INFO=""
FAILED_INFO=""

function __case_passed
{
    __OCCUPY_LINE_DELETE_ME__ #case passed post response
}

function __case_failed
{
    __OCCUPY_LINE_DELETE_ME__ #case failed post response
}

function __execute
{
    local modVers=`lscpu |grep "Model name" |awk -F " " '{print $6}'`
    local platform='unknown'
    case $modVers in
        'E3826'|'E3845')
            platform="byt"
            ;;
        'A3960'|'N4200')
            platform="apl"
            ;;
        '0000')
            platform="cnl"
            ;;
        *)
            logw 'Unsupported Model'
            return 1
    esac

    # Verify DSP firmware is presence
    [[ ! -f /lib/firmware/intel/sof-$platform.ri ]] && return 1

    return 0
}

