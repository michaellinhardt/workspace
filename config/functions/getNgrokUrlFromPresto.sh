#!/bin/bash

function getNgrokUrlFromPresto() {
  echo $(curl -s http://presto.vn/backend.json | jq -r '.url')
}
