# Run a Local Producer Node

## Workshop instructions

Complete [step two](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/producer-node-lab.md#2-get-node-info) by finding the missing plugin to configure nodeos using the config.ini file and also the console inline configuration.

The student must send ---> (where, to whom?):
1. The config.ini file used to run nodeos.
2. The command used to run nodeos from the terminal with the needed plugins (`.txt` file extension).

### Help material

To successfully complete this workshop the student can use the next support material:
- [Producer `config.ini` file](https://github.com/eoscostarica/sample-nodeos-configs/tree/docs/update/blockproducer/config)
- [Set specific nodeos options](https://developers.eos.io/manuals/eos/latest/nodeos/usage/nodeos-options)

## Goal

This laboratory aims to set up a single-node blockchain configuration running on a single host. This is referred to as a _**single host, single-node testnet**_. We will set up one node on your local computer to have it producing blocks. The following diagram depicts the desired single host testnet.

![Single host single node testnet](https://developers.eos.io/315123127612b3c9153341b9e7401d02/single-host-single-node-testnet.png)

## Before you begin

[Install the EOSIO software](https://developers.eos.io/manuals/eos/latest/install/index) before starting this section. It is assumed that `nodeos`, `cleos`, and `keosd` are accessible through the path.

## Workshop

### 1. Start the Producer Node

Start your own single-node blockchain:

- Create a `config.ini` file.
- Configure the producer node.

The more advanced user will likely need to modify the configuration. `nodeos` uses a custom configuration folder where the location is determined by your system.

> You can override this if you set a config dir using the `--config-dir` flag followed by the folder dir.

The default path for the nodeos configuration files are:
* Mac OS: `~/Library/Application\ Support/eosio/nodeos/config`
* Linux: `~/.local/share/eosio/nodeos/config`

The build seeds this folder with a default `config.ini` file. A configuration folder can be specified using the `--config-dir` command line argument to `nodeos`. If you use this option, you will need to manually copy a `config.ini` file to your custom config folder path.

`nodeos` will need a properly configured `config.ini` file in order to do meaningful work. On startup, `nodeos` looks in the config folder for `config.ini`. If one is not found, a default `config.ini` file is created.

If you do not already have a `config.ini` file ready to use, run `nodeos` and then close it immediately with <kbd>Ctrl-C</kbd>. A default configuration (`config.ini`) will have been created in the config folder. Edit the `config.ini` file, adding/updating the following settings to the defaults already in place:

```console
# config.ini:

# Enable production on a stale chain, since a single-node test chain is pretty much always stale
enable-stale-production = true
# Enable block production with the testnet producers
producer-name = eosio
# Load the block producer plugin, so you can produce blocks
plugin = eosio::producer_plugin
```

Now it should be possible to run `nodeos` and see it begin producing blocks.

```sh
nodeos
```

`nodeos` stores runtime data (e.g., shared memory and log content) in a custom data folder. The location of this folder is determined by your system.

* Mac OS: `~/Library/Application\ Support/eosio/nodeos/data`
* Linux: `~/.local/share/eosio/nodeos/data`

A data folder can be specified using the `--data-dir` command line argument to `nodeos`.

### 2. Get Node Info

To check if the node is running there is two main approaches, the first option is to get the information from terminal with `cleos get info` and the second option is to query `http://127.0.0.1:8888/v1/chain/get_info` from the browser, both of them require the action of a specific plugin.

The output information is as follow:

```
{
"server_version": "26a4d285",
"chain_id": "8a34ec7df1b8cd06ff4a8abbaa7cc50300823350cadc59ab296cb00d104d2b8f",
"head_block_num": 2690,
"last_irreversible_block_num": 2689,
"last_irreversible_block_id": "00000a81bbf44ad047212432e73a6b35b0ffe3da7d686506c54a0accf2c150f7",
"head_block_id": "00000a82d6d2e84fb203b40f49a8587507c49c18882b452b02a8249da3b7f6d1",
"head_block_time": "2021-12-24T03:43:23.000",
"head_block_producer": "eosio",
"virtual_block_cpu_limit": 2940449,
"virtual_block_net_limit": 15445818,
"block_cpu_limit": 199900,
"block_net_limit": 1048576,
"server_version_string": "v2.1.0",
"fork_db_head_block_num": 2690,
"fork_db_head_block_id": "00000a82d6d2e84fb203b40f49a8587507c49c18882b452b02a8249da3b7f6d1",
"server_full_version_string": "v2.1.0-26a4d285d0be1052d962149e431eb81500782991",
"last_irreversible_block_time": "2021-12-24T03:43:22.500"
}
```

## What's next?
To learn more about nodeos setup, you can explore:
- How to setup and run a [single-host, single-node testnet with consensus](https://developers.eos.io/manuals/eos/latest/nodeos/usage/development-environment/local-single-node-testnet-consensus).
- How to set up and run a [single-host, multi-node testnet](https://developers.eos.io/manuals/eos/latest/nodeos/usage/development-environment/local-multi-node-testnet).
