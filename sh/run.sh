#!/bin/bash

arg=$*
#nodemon ./src/test/rabbit_sender_receiver/new_task.js --exec ./node_modules/babel-cli/bin/babel-node.js $arg
./node_modules/babel-cli/bin/babel-node.js ./src/test/rabbit_sender_receiver/sender.js $arg
exit 0
