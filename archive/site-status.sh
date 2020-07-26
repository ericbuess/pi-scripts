#!/bin/bash

##name: site-status.sh

FAIL_CODE=6

check_status(){
    LRED="\033[1;31m" # Light Red
    LGREEN="\033[1;32m" # Light Green
    NC='\033[0m' # No Color


    $_WEBSITE_STATUS=curl -Is "${1} | head -n 1" > /dev/null
    echo -e ${_WEBSITE_STATUS}
    #if [ ! $? = ${FAIL_CODE} ];then
    if [ ! ${_WEBSITE_STATUS} = "HTTP/1.1 200 OK" ];then
        echo -e "${LRED}${1} is down${NC}"
    else
        echo -e "${LGREEN}${1} is online${NC}"
    fi
}


check_status "${1}"
