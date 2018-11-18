__execute $* 2>&1
[[ $? -ne 0 ]] && _case_failed || _case_passed
