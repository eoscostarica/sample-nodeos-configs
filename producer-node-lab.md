# Run a Local Producer Node

## Goal

This section describes how to set up a single-node blockchain configuration running on a single host. This is referred to as a _**single host, single-node testnet**_.  We will set up one node on your local computer and have it producing blocks. The following diagram depicts the desired single host testnet.

![Single host single node testnet](https://developers.eos.io/315123127612b3c9153341b9e7401d02/single-host-single-node-testnet.png)

`cleos` is used to interact with wallets, and send actions to the blockchain. `keosd` performs wallet management, including digital signing. If not started explicitly, `keosd` is started by `cleos` by default.

## Thing to learn

- [Run a Local Producer Node](#run-a-local-producer-node)
  - [Goal](#goal)
  - [Thing to learn](#thing-to-learn)
  - [Before you begin](#before-you-begin)
    - [1. Start the Producer Node](#1-start-the-producer-node)
    - [2. Get Node Info](#2-get-node-info)

## Before you begin

* [Install the EOSIO software](https://developers.eos.io/manuals/eos/latest/install/index) before starting this section. It is assumed that `nodeos`, `cleos`, and `keosd` are accessible through the path.
* Understand how to set options to [Nodeos configuration](https://developers.eos.io/manuals/eos/latest/nodeos/usage/nodeos-options) to enable or disable functionality.

### 1. Start the Producer Node

Start your own single-node blockchain with single steps:

- Create a genesis json file 
- Configure the producer node 
- Logging JSON

The more advanced user will likely have need to modify the configuration. `nodeos` uses a custom configuration folder. The location of this folder is determined by your system.

* Mac OS: `~/Library/Application\ Support/eosio/nodeos/config`
* Linux: `~/.local/share/eosio/nodeos/config`

The build seeds this folder with a default `config.ini` file.  A configuration folder can be specified using the `--config-dir` command line argument to `nodeos`.  If you use this option, you will need to manually copy a `config.ini` file to your config folder.
 
`nodeos` will need a properly configured `config.ini` file in order to do meaningful work.  On startup, `nodeos` looks in the config folder for `config.ini`.  If one is not found, a default `config.ini` file is created.  If you do not already have a `config.ini` file ready to use, run `nodeos` and then close it immediately with <kbd>Ctrl-C</kbd>. A default configuration (`config.ini`) will have been created in the config folder. Edit the `config.ini` file, adding/updating the following settings to the defaults already in place:

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

`nodeos` stores runtime data (e.g., shared memory and log content) in a custom data folder.  The location of this folder is determined by your system.

* Mac OS: `~/Library/Application\ Support/eosio/nodeos/data`
* Linux: `~/.local/share/eosio/nodeos/data`

A data folder can be specified using the `--data-dir` command line argument to `nodeos`.

[[info | What's next?]]
| You can explore how to setup and run a [single-host, single-node testnet with consensus](https://developers.eos.io/manuals/eos/latest/nodeos/usage/development-environment/local-single-node-testnet-consensus) or
| You can explore how to setup and run a [single-host, multi-node testnet](https://developers.eos.io/manuals/eos/latest/nodeos/usage/development-environment/local-multi-node-testnet).

### 2. Get Node Info

To check if the node is running there is two main approaches, the first option is the get the node information from terminal and the second option is to query `http://127.0.0.1:8888/v1/chain/get_info` from the browser, but for this second approach is necessary to active some plugins.