#!/bin/bash
# My script

#Ubuntu 14.04 Remote
#USERNAME=mauricio
#PASSWORD=personal
#HOST=10.3.9.7

#Centos 7 Yuxi Release Server
USERNAME=root
PASSWORD=2016.D0ck3r
HOST=10.3.9.1

#Fedora 23
#SCRIPT1="eval IMAGEID=$(docker images --format '{{.ID}}' crunchify);"
#SCRIPT2='eval CONTAINERS=$(docker ps -aq --filter="ancestor=${IMAGEID}");'
#SCRIPT3='eval if [ ! -z "$CONTAINERS" ]; docker stop $CONTAINERS; then docker rm -f ${CONTAINERS}; fi;'
#SCRIPT4='eval if [ ! -z "$IMAGEID" ]; then docker rmi -f ${IMAGEID}; fi;'

#Ubuntu 14.04
SCRIPT1='IMAGEID=$(docker images --format {{.ID}} yuxi_crunchify_release);'
SCRIPT2='CONTAINERS=$(docker ps -aq --filter="ancestor=$IMAGEID");' #'eval CONTAINERS=$(docker ps -aq --filter="ancestor=${IMAGEID}")'
SCRIPT3='if [ ! -z "$CONTAINERS" ]; then docker stop $CONTAINERS; docker rm -f $CONTAINERS; fi;'
SCRIPT4='if [ ! -z "$IMAGEID" ]; then docker rmi -f $IMAGEID; fi;'

#Ubuntu 14.04 - Fedora 23
#SCRIPT5="cd /home/mauricio/code/CrunchifyTutorials; git pull; cd docker;" 
#SCRIPT6="docker build -t yuxi_crunchify_release .;"
#SCRIPT7="docker run -i -p 8080:8080 yuxi_crunchify_release;"

#v
SCRIPT5="cd code/CrunchifyTutorials; git pull; cd docker;" 
SCRIPT6="docker build -t yuxi_crunchify_release .;"
SCRIPT7="docker run -p 8080:8080 yuxi_crunchify_release;"

#Execution Fedora 23
#${SCRIPT1} ${SCRIPT2} 
#${SCRIPT3} 
#${SCRIPT4} ${SCRIPT5} ${SCRIPT6}

#Execution Ubuntu 14.04 - Centos 7 Yuxi Release Server
if [ "$1" == "true" ]; then
	sshpass -p ${PASSWORD} ssh ${USERNAME}@${HOST} ${SCRIPT1} ${SCRIPT2} ${SCRIPT3} ${SCRIPT4} ${SCRIPT5} ${SCRIPT6} ${SCRIPT7}
else
	if [ "$1" == "false" ]; then
		sshpass -p ${PASSWORD} ssh ${USERNAME}@${HOST} ${SCRIPT1} ${SCRIPT2} ${SCRIPT3} ${SCRIPT5} ${SCRIPT6} ${SCRIPT7}
	fi
fi