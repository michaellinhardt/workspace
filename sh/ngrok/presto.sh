#!/bin/bash

. $FUNCTIONS_CONF/newTab.sh
. $FUNCTIONS_CONF/getNgrokUrl.sh

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

echo Moving to ~/dev/presto.vn/
cd ~/dev/presto.vn/
echo Erase old backend.json file
rm -rf ~/dev/presto.vn/backend.json
echo "Write new json: "
echo "{ \"url\": \""$url"\" }" | jq
echo "{ \"url\": \""$url"\" }" >> ~/dev/presto.vn/backend.json
echo "Send file to FTP server.."
sh ~/dev/presto.vn/updateBackendUrl.sh
echo Back to initial directory..
cd -
echo "Done!"
exit 0
