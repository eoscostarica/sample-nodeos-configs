#!/usr/bin/env bash
echo "Starting Producing Node... \n";
set -ex;
ulimit -n 65535
ulimit -s 64000

CONFIG_DIR="config";
DATA_DIR="data";
SIGNING_PUB_KEY="" # Insert your public key here
SIGNING_PRIV_KEY="" # Insert your private key here

mkdir -p $DATA_DIR


start_nodeos=$"nodeos \
  --config-dir $CONFIG_DIR \
  --data-dir $DATA_DIR \
  --blocks-dir $DATA_DIR/blocks
  --signature-provider $SIGNING_PUB_KEY=KEY:$SIGNING_PRIV_KEY" ;

$start_nodeos & echo $! > $CONFIG_DIR/nodeos.pid