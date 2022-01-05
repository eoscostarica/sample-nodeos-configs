# Recovery Lab

## Goal

This laboratory aim is to recover the blockchain state from a snapshot. The student will learn to set up a snapshot and take it as reference to run a blockchain either to restart due to a failure or to start a new node.

## Workshop instructions

Edit the `config.ini` file created in [Run a Local Producer Node](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/producer-node-lab.md) laboratory by adding the `producer_api_plugin` plugin. Later create the snapshot and replay `nodeos` from it.

> This laboratory assumes the project is running in your local machine

The student must send:
1. The `nodeos.log` file created in the step `Finally, run nodeos`.

### Help material

To help you complete this tutorial, you can consult next material:
- [Nodeos Replays](https://developers.eos.io/manuals/eos/v2.0/nodeos/replays/index).

## Prerequisite
To successfully complete this laboratory, please, make sure you have next requirement:
- [Install the EOSIO software](https://developers.eos.io/manuals/eos/latest/install/index). It is assumed that `nodeos`, `cleos`, and `keosd` are accessible through the execution PATH.
- [Complete the producer node lab](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/producer-node-lab.md).

## Workshop

### 1. Copy the `Run a Local Producer Node` laboratory
Copy the `Run a Local Producer Node` laboratory you have already completed and add the `producer_api_plugin` plugin in the `config.ini` file. Once it is done, run again the nodeos as you did in [the producer node laboratory](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/producer-node-lab.md).

The final `config.ini` file is:

```sh
enable-stale-production = true
producer-name = eosio
plugin = eosio::producer_plugin

# New plugin to create snapshots
plugin = eosio::producer_api_plugin
```

### 2. Generate a Snapshot
To restore a dawn node or start a new one from a snapshot, firstly it is needed to have created the snapshot file. To do so, run:

1. Open your terminal.
2. Paste next command `curl -X POST http://127.0.0.1:8888/v1/producer/create_snapshot` into the terminal.

> By default, snapshots are written to the data/snapshots directory relative to your nodeos data directory.

The resulting snapshot file would be similar to `snapshot-0000006105c35d011d0ee0a17f7d30893ee58c3ba5f4be15fd864b5c83ceabfe.bin`. Make sure you remember this path, it is going to be needed in the following step.

### 3. Replay from a Snapshot
For this laboratory, we are going to replay from an empty folder, follow next steps to successfully replay nodeos from a snapshot.

1. Run the following command to create the working folder.

```sh
mkdir ~/recovery-lab
```

2. Copy the snapshot you created in [step two](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/recovery-lab.md#2-generate-a-snapshot) to the working folder.

```sh
cp <SNAPSHOT_NAME>.bin ~/recovery-lab
```

3. Create next variables in your terminal:

```sh
SNAPSHOT=latest.bin
CONFIG_DIR=./config
DATA_DIR=./blockchain
```

4. Rename the snapshot file for a better comprehension:

```sh
cd ~/recovery-lab
mv <SNAPSHOT_NAME>.bin latest.bin
```

> In case you set a different name than `latest.bin` for the snapshot file, make sure to update the value for `SNAPSHOT` variable to the new name.

5. Create the snapshot folder.

```sh
cd ~/recovery-lab
mkdir -p $DATA_DIR/snapshots
```

6. Copy the snapshot file located in your working folder to the snapshots folder.

```sh
cd ~/recovery-lab
cp latest.bin $DATA_DIR/snapshots/
```

7. Create the `config` folder.
```sh
mkdir ~/recovery-lab/$CONFIG_DIR
```

8. Copy the latest version of the `config.ini` file you modified in the [step one](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/recovery-lab.md#1-copy-the-run-a-local-producer-node-laboratory) and paste it into the `config` folder.

```sh
cd ~/recovery-lab
cp <MODIFIED_CONFIG_INI_FILE> $CONFIG_DIR
```

9. Finally, run nodeos.

```sh
nodeos \
  --config-dir ./config \
  --data-dir $DATA_DIR/ \
  --blocks-dir $DATA_DIR/blocks \
  --snapshot $DATA_DIR/snapshots/$SNAPSHOT \
  >> nodeos.log 2>&1 &
```

To check if the replay was successfully, run:

```sh
tail -f nodeos.log
```

You should get an output like:

```console
info  2022-01-06T05:48:52.464 thread-0  http_plugin.cpp:877           operator()           ] start listening for http requests
info  2022-01-06T05:48:52.466 thread-0  http_plugin.cpp:983           add_handler          ] add api url: /v1/node/get_supported_apis
info  2022-01-06T05:48:52.470 thread-0  producer_plugin.cpp:2333      produce_block        ] Produced block 6b74690bf476c0c6... #362 @ 2022-01-06T05:48:52.500 signed by eosio [trxs: 0, lib: 361, confirmed: 0]
info  2022-01-06T05:48:52.907 thread-0  producer_plugin.cpp:2333      produce_block        ] Produced block 5e074e7221533e71... #363 @ 2022-01-06T05:48:53.000 signed by eosio [trxs: 0, lib: 362, confirmed: 0]
info  2022-01-06T05:48:53.302 thread-0  producer_plugin.cpp:2333      produce_block        ] Produced block f7b67b9dfc98422a... #364 @ 2022-01-06T05:48:53.500 signed by eosio [trxs: 0, lib: 363, confirmed: 0]
info  2022-01-06T05:48:53.902 thread-0  producer_plugin.cpp:2333      produce_block        ] Produced block 5d87d585b72718ed... #365 @ 2022-01-06T05:48:54.000 signed by eosio [trxs: 0, lib: 364, confirmed: 0]
info  2022-01-06T05:48:54.402 thread-0  producer_plugin.cpp:2333      produce_block        ] Produced block d2ff4ced2b7c1593... #366 @ 2022-01-06T05:48:54.500 signed by eosio [trxs: 0, lib: 365, confirmed: 0]
```

> The starting producing blockchain number should be different to 0, for this example, the starting block is `#362`. You can validate it in the line `info  2022-01-06T05:48:52.470 thread-0  producer_plugin.cpp:2333      produce_block        ] Produced block 6b74690bf476c0c6... #362 @ 2022-01-06T05:48:52.500 signed by eosio [trxs: 0, lib: 361, confirmed: 0]`.

## What's next?

- [Replay from Blocks.log](https://developers.eos.io/manuals/eos/latest/nodeos/replays/index)
- [Prune Blocks Logs using block-log utility](https://developers.eos.io/manuals/eos/v2.1/utilities/eosio-blocklog)