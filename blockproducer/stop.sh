#!/bin/bash

CONFIG_DIR="config";
DATA_DIR="data";

if [ -f $CONFIG_DIR"/nodeos.pid" ]; then
pid=`cat $CONFIG_DIR"/nodeos.pid"`
echo $pid
kill $pid


echo -ne "Stoping Nodeos"

    while true; do
        [ ! -d "/proc/$pid/fd" ] && break
        echo -ne "."
        sleep 1
    done
rm -r $CONFIG_DIR"/nodeos.pid"

DATE=$(date -d "now" +'%Y_%m_%d-%H_%M')
    if [ ! -d $DATA_DIR/logs ]; then
        mkdir $DATA_DIR/logs
    fi
    tar -pcvzf $DATA_DIR/logs/stderr-$DATE.txt.tar.gz $DATA_DIR/stderr.txt $DATA_DIR/stdout.txt


    echo -ne "\rNodeos Stopped.    \n"
fi
