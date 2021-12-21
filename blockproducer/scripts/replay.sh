#!/usr/bin/env bash
echo "Starting Hard Replay of Producing Node... \n";
set -ex;
ulimit -n 65535
ulimit -s 64000

CONFIG_DIR="../config";
DATA_DIR="../data";
SIGNING_PUB_KEY="EOS692HWJWGN9zHxdqKXUfvnjqo37oG5h7rYtCuZojfedw889KNTE" # Insert your public key here
SIGNING_PRIV_KEY="5JRHuxgB46enx9p2JfdB6AmkYTfJrYB5CrCeA5E22QvsKJcTW9r" # Insert your private key here

nodeos=$"nodeos \
  --config-dir $CONFIG_DIR \
  --data-dir $DATA_DIR \
  --blocks-dir $DATA_DIR/blocks \
  --signature-provider $SIGNING_PUB_KEY=KEY:$SIGNING_PRIV_KEY \
  --eplay-blockchain" ;

nodeos