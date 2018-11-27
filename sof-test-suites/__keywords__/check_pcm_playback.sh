#!/bin/bash
# Check playback function$

__TEST_FREQ=("17" "31" "67" "131" "257" "521" "997" "1033" "2069" "4139" "8273" "16547")

# check the pcm playback
# param: $1 rate, $2 fmt, $3 comment
function check_pcm_playback
{
    local rate=$1
    if [[ ${rate} != `echo $rate | sed 's/[^0-9.]//g'` ]]; then
        if [[ ${rate:${#rate}-1:1} =~ [k|K] ]]; then
            rate=$(echo "${rate:0:-1} * 1000" | bc)
            rate=${rate%.*}
        else
            logw "wrong input rate: "$rate
            exit 1
        fi
    fi

    local fmt=$2
    fmt=${fmt:0:3}_${fmt:3:2}

    local comment=$3
    local passedCnt=0
    for freq in ${__TEST_FREQ[@]}; do
        alsabat -P hw:0,0 -r $rate -c 2 -f $fmt -F $freq
        if [[ $? -eq 0 ]]; then
            logi "check pcm playback ($rate, $fmt, $freq) passed"
            passedCnt=$((passedCnt + 1))
        else
            logi "check pcm playback ($rate, $fmt, $freq) failed"
        fi
    done

    [[ $passedCnt -eq ${#__TEST_FREQ[@]} ]] && exit 0 || exit 1
}
