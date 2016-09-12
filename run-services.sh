#!/bin/sh

modify_filebeat()
{
    echo "Filebeat Param: $1"
    NAME=`echo $1 | cut -d '=' -f 1`
    VALUE=`echo $1 | cut -d '=' -f 2`
    sed -i "s|${NAME}|${VALUE}|" /filebeat.yml
}

ARRAY_FILEBEAT=`set | grep -E ^FILEBEAT_`
if [ ! -z "${ARRAY_FILEBEAT}" ] ; then
    for PARAM in ${ARRAY_FILEBEAT} ; do
	modify_filebeat ${PARAM}
    done
fi

shutdown_filebeat()
{
    echo "Stopping container..."
    killall filebeat
    exit 0
}

trap shutdown_filebeat SIGINT SIGTERM SIGHUP

/bin/filebeat -c /filebeat.yml > /var/log/filebeat.log

tail -f /var/log/filebeat.log &

wait

