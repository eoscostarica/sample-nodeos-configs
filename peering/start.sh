#!/usr/bin/env bash
echo "Starting Peering Node... \n";
set -ex;
ulimit -n 65535
ulimit -s 64000

CONFIG_DIR="config";
DATA_DIR="data";

mkdir -p $DATA_DIR

start_nodeos=$"nodeos \
  --config-dir $CONFIG_DIR \
  --data-dir $DATA_DIR \
  --blocks-dir $DATA_DIR/blocks" ;

$start_nodeos & echo $! > $CONFIG_DIR/nodeos.pid