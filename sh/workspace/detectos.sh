#!/bin/bash
os='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	os='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
	os='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
	os='osx'
fi
echo $os
