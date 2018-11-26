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
    # Verify DSP firmware is presence
    [[ ! -f /lib/firmware/intel/sof-$_PLATFORM.ri ]] && return 1

    # TODO: list all firmware that need be checked.
    return 0
}

