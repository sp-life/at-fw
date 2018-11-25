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
    echo 'verify pcm list ...'
    echo "------>>>>>>"$tplg
    for i in ${TPLG_PCM_LIST[@]}; do
        echo $i
    done
    #aplay -l
    #arecord -l
    return 0
}
