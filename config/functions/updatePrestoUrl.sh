#!/bin/bash
. $FUNCTIONS_CONF/getNgrokUrlFromPresto.sh

function updatePrestoUrl() {
  url=$1

  if [ ! "$url" -o "$url" = "null" ]
  then
    echo Can not upload blank url...
    exit 1
  fi

 if [ "$url" != "http://localhost:4242" ]
  then
    target="http:"
    replace="https:"
    url=${url//$target/$replace}
  fi

  distant=$(getNgrokUrlFromPresto)
  echo "{ \"distant_url\": \""$distant"\", \"current_url\": \""$url"\" }" | jq

  if [ "$distant" = "$url" ]
  then
      echo No need to update
      exit 0
  fi

  echo Upload process start!
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
  echo ""
  distant2=$(getNgrokUrlFromPresto)
    if [ "$distant2" = "$url" ]
  then
      echo "### Successfully updated"
      exit 0
  else
      echo "### Update failed, distant is: $distant2"
      exit 1
  fi
}
