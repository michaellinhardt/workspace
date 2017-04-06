#!/bin/bash

arg=$*
#nodemon ./src/test/rabbit_sender_receiver/new_task.js --exec ./node_modules/babel-cli/bin/babel-node.js $arg
babel-node ./src/test/rabbit/rpc_client.js $arg
exit 0
