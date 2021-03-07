#!/bin/sh
echo "pre process...." >&1

mkdir -p /data/plugins
CONFIGFILE=/data/server.properties

#env
if [ -z "${WORLDTYPE}" ]; then
	WORLDTYPE="flat"
fi
if [ ! "${WORLDTYPE}" = "flat" ]; then
	 WORLDTYPE =  "default"
fi
if [ -z "${GAMEMODE}" ]; then
	GAMEMODE="creative"
fi
if [ ${GAMEMODE} = "creative" ];then
	GAMEMODE=1
else
	GAMEMODE=0
fi
if [ -z "${SRVDOMAIN}" ]; then
	SRVDOMAIN="0.0.0.0"
fi

if [ ! -z "${OPNAME}" ]; then
      echo ${OPNAME} > /data/ops.txt
fi

#config
echo "motd=${SRVID} [MiRm-PMMP]" > ${CONFIGFILE}
echo "server-port=19132" >> ${CONFIGFILE}
echo "level-type=${WORLDTYPE}" >> ${CONFIGFILE}
echo "gamemode=${GAMEMODE}" >> ${CONFIGFILE}
echo "server-ip=${SRVDOMAIN}" >> ${CONFIGFILE}
echo "language=jpn" >> ${CONFIGFILE}
echo "xbox-auth=false" >> ${CONFIGFILE}


echo "pre process....done" >&1
