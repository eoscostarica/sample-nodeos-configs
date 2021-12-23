# Sample Nodeos Configurations
Example configuration for different EOSIO node types

## File Structure

Within the repo you'll find the following files and directories:

```
. 
├── blockproducer ........................ EOSIO Producing Node Example Config
│ ├── launch-chain.sh .................... Start chain from genesis block 
│ ├── start.sh ........................... Restart chain from last synced block
│ ├── stop.sh ............................ Perform nodeos graceful shutdown
│ ├── replay.sh .......................... Replay chain from blocks.log
│ ├── hard-replay.sh ..................... Hard replay chain from blocks.log
│ ├── claimrewards.sh .................... Claim block producer rewards (dPOS)
│ ├── config/ ............................ Nodeos config directory
│ │ └── config.ini ....................... Block Producer node configuration file
│ └── data/ .............................. Nodeos data directory
├── chain-api/ ........................... EOSIO query node example config
├── peering/ ............................. EOSIO seed node example config
├── default.config.ini ................... Default nodeos configuration  
├── default.genesis.json ................. Default genesis.json configuration 
├── logging.json ......................... Default logging.json configuration 
├── producer-node-lab.md ................. Local producer node assignment
├── query-node-lab.md .................... Testnet query node assignment
└── recovery-lab.md ...................... Node recovery lab assignment
```

# Node Operator Labs 

## [Producer Node Lab](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/producer-node-lab.md)
**Assignment:**  Configure a local block producer node

## [Query Node Lab](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/query-node-lab.md)
**Assignment:**  Configure an API node on a public testnet

## [Recovery Lab](https://github.com/eoscostarica/sample-nodeos-configs/blob/main/recovery-lab.md)
**Assignment:**  Chain Replays and Backup Recovery 

# Blockchain Admin Labs

## [EOSIO Network Boot Sequence](https://guide.eoscostarica.io/docs/tutorials/private-network-installation)

- [EOSIO network bootstrap](https://github.com/eoscostarica/eosio-network-bootstrap)

