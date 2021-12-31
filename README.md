# Sample Nodeos Configurations
Example configurations for different EOSIO node types

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

# Node Operator Labs 

## [Producer Node Lab Assignment](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/producer-node-lab.md)
Configure a local block producer node

## [Query Node Lab Assignment](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/query-node-lab.md)
Configure an API node on a public testnet

## [Recovery Lab Assignment](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/recovery-lab.md)
Chain Replays and Backup Recovery 

# Blockchain Admin Labs

## [EOSIO Network Boot Sequence](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/network-boot-lab.md)

Follow the steps to Launch your own EOSIO network using the [EOSIO network bootstrap](https://github.com/eoscostarica/eosio-network-bootstrap) tool.
