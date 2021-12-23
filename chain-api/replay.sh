#!/usr/bin/env bash
echo "Starting Hard Replay of API Node... \n";
set -ex;
ulimit -n 65535
ulimit -s 64000

CONFIG_DIR="config";
DATA_DIR="data";

replay_nodeos=$"nodeos \
  --config-dir $CONFIG_DIR \
  --data-dir $DATA_DIR \
  --blocks-dir $DATA_DIR/blocks \
  --replay-blockchain" ;

$replay_nodeos & echo $! > $CONFIG_DIR/nodeos.pid