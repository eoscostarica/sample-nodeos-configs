<p align="center">
   <img src="./eosio-logo.jpeg">
</p>

# Sample Nodeos Configurations
**Example configurations for different EOSIO node types**

![](https://img.shields.io/github/license/eoscostarica/sample-nodeos-configs) ![](https://img.shields.io/badge/code%20style-standard-brightgreen.svg) ![](https://img.shields.io/badge/%E2%9C%93-collaborative_etiquette-brightgreen.svg) ![](https://img.shields.io/twitter/follow/eoscostarica.svg?style=social&logo=twitter) ![](https://img.shields.io/github/forks/eoscostarica/sample-nodeos-configs?style=social)


## Project Description

This repository contains a collection of nodeos configuration files and other helpful resources meant to assist students of the [EOSIO Node Operator](https://training.eos.io/courses/eosio-node-operator) and [EOSIO Blockchain Administrator](https://training.eos.io/courses/eosio-blockchain-administrator) courses learn from first hand experience.

There are also four student lab assignments included in this repository that must be completed by students to obtain the course certification.

## File Structure

Within the repo you'll find the following files and directories:

```
. 
├── blockproducer ........................ EOSIO Producing Node Example Config
│ ├── launch-chain.sh .................... Start chain from genesis block 
│ ├── start.sh ........................... Restart chain from last synced block
│ ├── stop.sh ............................ Perform nodeos graceful shutdown
│ ├── claimrewards.sh .................... Claim block producer rewards (dPOS)
│ ├── config/ ............................ Nodeos config directory
│ │ └── config.ini ....................... Block Producer node configuration file
│ └── data/ .............................. Nodeos data directory
├── chain-api/ ........................... EOSIO query node example config
│ ├── start.sh ........................... Restart chain from last synced block
│ ├── stop.sh ............................ Perform nodeos graceful shutdown
│ ├── replay.sh .......................... Replay chain from blocks.log
│ └── hard-replay.sh ..................... Hard replay chain from blocks.log
│ ├── config/ ............................ Nodeos config directory
│ │ └── config.ini ....................... Chain API node configuration file
├── peering/ ............................. EOSIO seed node example config
│ ├── start.sh ........................... Restart chain from last synced block
│ ├── stop.sh ............................ Perform nodeos graceful shutdown
│ ├── config/ ............................ Nodeos config directory
│ │ └── config.ini ....................... Peering node configuration file 
│ │ └── peering-node-specified.ini........ Specified peers example configuration
├── default.config.ini ................... Default values for nodeos configuration  
├── default.genesis.json ................. Default genesis.json configuration 
├── logging.json ......................... Default logging.json configuration 
├── producer-node-lab.md ................. Local producer node assignment
├── query-node-lab.md .................... Testnet query node assignment
└── recovery-lab.md ...................... Node recovery lab assignment
```

# Node Operator Course Labs 

## [Producer Node - Lab Assignment](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/producer-node-lab.md)
Configure a local block producer node

## [Query Node - Lab Assignment](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/query-node-lab.md)
Configure an API node on a public testnet

## [Recovery - Lab Assignment](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/recovery-lab.md)
Chain Replays and Backup Recovery 

# Blockchain Admin Course Labs

## [EOSIO Network Boot Sequence](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/network-boot-lab.md)

Follow the steps to Launch your own EOSIO network using the [EOSIO network bootstrap](https://github.com/eoscostarica/eosio-network-bootstrap) tool.

# Contributing

Please read EOS Costa Rica's [Open Source Contributing Guidelines](https://developers.eoscostarica.io/docs/open-source-guidelines).

Please report bugs big and small by [opening an issue](https://github.com/eoscostarica/sample-nodeos-configs/issues/new/choose)

## About EOS Costa Rica

<p align="center">
	<a href="https://eoscostarica.io">
		<img src="https://github.com/eoscostarica/eos-rate/raw/master/docs/eoscostarica-logo-black.png" width="300">
	</a>
</p>
<br/>

EOS Costa Rica is an independently-owned, self-funded, bare-metal Genesis block producer that provides stable and secure infrastructure for EOSIO blockchains. We support open source software for our community while offering enterprise solutions and custom smart contract development for our clients.

[eoscostarica.io](https://eoscostarica.io)
