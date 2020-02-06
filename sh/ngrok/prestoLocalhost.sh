#!/bin/bash

url=http://localhost:4242

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
