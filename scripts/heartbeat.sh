#! /bin/bash

URL=$HEARTBEAT_URL
DELAY=$TIMEOUT_IN_SECONDS

if [ -z $URL ]; then
    echo "Missing heartbeat endpoint URL"
    exit -1
fi

if [ -z $DELAY ]; then
    # 30 minutes by default
    DELAY=1800
fi

while :
do
    curl -X GET -I $URL
    sleep $DELAY
done
