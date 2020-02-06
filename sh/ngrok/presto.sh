#!/bin/bash

. $FUNCTIONS_CONF/newTab.sh
. $FUNCTIONS_CONF/getNgrokUrl.sh
. $FUNCTIONS_CONF/updatePrestoUrl.sh

function loopGetNgrokUrl() {
    if [ $retry -gt 0 ] && [ ! "$url" -o "$url" = "null" ]
    then
        retry=$((retry-1))
        echo "Trying to get ngrok url... ($retry)"
        sleep 0.5
        url=$(getNgrokUrl)
        loopGetNgrokUrl
    fi
}

retry=11
echo "Trying to get ngrok url... ($retry)"
url=$(getNgrokUrl)

if [ ! "$url" -o "$url" = "null" ]
then
    newTab 'ngrok http 4242'
    echo "Running Ngrok.."
    loopGetNgrokUrl
fi

if [ ! "$url" -o "$url" = "null" ]
then
    echo Can not get the ngrok url..
    exit 1
fi

updatePrestoUrl $url
