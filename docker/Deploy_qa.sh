#!/bin/bash
# My script

USERNAME=mauricio
PASSWORD=personal
HOST=10.3.9.7

#Fedora 23
#SCRIPT1="eval IMAGEID=$(docker images --format '{{.ID}}' crunchify);"
#SCRIPT2='eval CONTAINERS=$(docker ps -aq --filter="ancestor=${IMAGEID}");'
#SCRIPT3='eval if [ ! -z "$CONTAINERS" ]; docker stop $CONTAINERS; then docker rm -f ${CONTAINERS}; fi;'
#SCRIPT4='eval if [ ! -z "$IMAGEID" ]; then docker rmi -f ${IMAGEID}; fi;'

#Ubuntu 14.04 Remote
SCRIPT1='IMAGEID=$(docker images --format {{.ID}} yuxi_carganet_release);'
SCRIPT2='CONTAINERS=$(docker ps -aq --filter="ancestor=$IMAGEID");' #'eval CONTAINERS=$(docker ps -aq --filter="ancestor=${IMAGEID}")'
SCRIPT3='if [ ! -z "$CONTAINERS" ]; then docker stop $CONTAINERS; docker rm -f $CONTAINERS; fi;'
SCRIPT4='if [ ! -z "$IMAGEID" ]; then docker rmi -f $IMAGEID; fi;'

#Two Linux Versions
SCRIPT5="cd /home/mauricio/code/CrunchifyTutorials; git pull; cd docker;" 
SCRIPT6="docker build -t yuxi_carganet_release .;"
SCRIPT7="docker run -i -p 8080:8080 yuxi_carganet_release;"

#Execution Fedora 23
#${SCRIPT1} ${SCRIPT2} 
#${SCRIPT3} 
#${SCRIPT4} ${SCRIPT5} ${SCRIPT6}

#Execution Ubuntu 14.04 Remote
if [ "$1" == "true" ]; then
    sshpass -p ${PASSWORD} ssh ${USERNAME}@${HOST} ${SCRIPT1} ${SCRIPT2} ${SCRIPT3} ${SCRIPT4} ${SCRIPT5} ${SCRIPT6} ${SCRIPT7}
else
	if [ "$1" == "false" ]; then
		sshpass -p ${PASSWORD} ssh ${USERNAME}@${HOST} ${SCRIPT1} ${SCRIPT2} ${SCRIPT3} ${SCRIPT5} ${SCRIPT6} ${SCRIPT7}
	fi
fi