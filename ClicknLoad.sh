#!/bin/sh

ssh -L 127.0.0.1:9666:127.0.0.1:9666 -N ip.zum.rasp.berry

#SSH="ssh -v -N -f -L ${LOCALHOST}:${LOCALPORT}:${REMOTEHOST}:${REMOTEPO RT} ${REMOTELOGIN}"
#SSHPID=`ps axww | grep "${SSH}" | grep -v 'grep'
#kill ${SSHPID}

