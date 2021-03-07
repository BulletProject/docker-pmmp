#!/bin/sh


#############
#Del Tmpdir #
#############
rm -rf /tmp/*

#############
#ChkDisk    #
#############
bash /resources/echoStorage.sh

#############
#InitProcess#
#############
ls /resources/

if [ -e /resources/initialstart ]; then 
	echo "Initial Start..." >&1

	#-----------------#
	#Minecraft Prepare#
	#-----------------#

	echo "Preparation pmmp has been selected." >&1
	sh /resources/pre-BE-PMMP.sh
	rm -rf /resources/initialstart
	echo "Initial Start...done" >&1
fi

#############
#ChkDisk    #
#############
bash /resources/echoStorage.sh

############
#Minecraft #
############
echo "Main Server Start..." >&1


UNIXTIME_START=$(date +%s)

cd ${DATAPATH}

echo "Starter pmmp has been selected." >&1
sh /resources/run-BE-PMMP.sh

UNIXTIME_END=$(date +%s)

#if too short to stop then,
if [ "$((${UNIXTIME_END}-${UNIXTIME_START}))"  -gt 30 ]; then
	echo "Main Server Start...done" >&1
else
	echo "Main Server Start...failed" >&1
	echo "Waiting for User Action for 10 min..." >&1
	sleep 600
	echo "Waiting for User Action for 10 min...done" >&1
fi

#############
#ChkDisk    #
#############
bash /resources/echoStorage.sh

if [ -z "${ER}" ]; then
	echo "Shutdown..." >&2
	exit 1
else
	echo "Shutdown..." >&1
	exit 0
fi

