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
    logi "tplg execute something..." ${_TPLG_LIST[@]}
    for tplg in ${_TPLG_LIST[@]}; do
        echo "----...>>>....tplg item: " $tplg
    done
exit 1
    return 0
}
