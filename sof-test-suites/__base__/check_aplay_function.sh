#!/bin/bash
PASSED_INFO=""
FAILED_INFO=""

__STEREO=2
__DURATION=5

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
    logi "tplg execute something..."
    local tplgDat=($(tplgreader -i $_TPLG -j))
    [[ ${#tplgDat[@]} -eq 0 ]] && return 1

    local pbCnt=0
    local passedCnt=0
    for tplg in ${tplgDat[@]}; do
        local type=$(dict_value $tplg 'TYPE')
        if [[ $type == both || $type == playback ]]; then
            pbCnt=$((pbCnt + 1))
            local devId=$(dict_value $tplg 'ID')
            local dev="hw:0,$devId"
            logw $dev
            local fmt=$(dict_value $tplg 'FMT')
            fmt=${fmt:0:3}_${fmt:3:2}
            local rate=$(dict_value $tplg 'RATE_MIN')
            aplay -D $dev -r $rate -c $__STEREO -f $fmt -d $__DURATION /dev/zero
            if [[ $? -eq 0 ]]; then
                logi "aplay SUCCESS via PCM: "$(dict_value $tplg 'PCM')
                passedCnt=$((passedCnt + 1))
            else
                logi "aplay FAILED via PCM: "$(dict_value $tplg 'PCM')
            fi
        fi
    done

    [[ $passedCnt -eq $pbCnt ]] && return 0 || return 1
}
