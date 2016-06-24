#!/bin/bash
# My first script

USERNAME=mauricio
PASSWORD=personal
HOST=10.3.8.134
SCRIPT1="cd /home/mauricio/code/CrunchifyTutorials; git pull; cd docker; docker build -t crunchify .;"
SCRIPT2="docker run -i -p 8080:8080 crunchify;"


if [ "$1" == "true" ]; then
    sshpass -p ${PASSWORD} ssh ${USERNAME}@${HOST} ${SCRIPT1} ${SCRIPT2}
fi