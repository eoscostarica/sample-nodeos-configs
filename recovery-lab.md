# Recovery Lab

## Nodeos Replays
- [Recover from genesis](blockproducer/launch-chain.sh)
- [Recover via replay](blockproducer/replay.sh)
- [Recover via hard replay](blockproducer/hard-replay.sh)

## Nodeos Backups
- [Recover From a `blocks.log` file](https://developers.eos.io/manuals/eos/v2.0/nodeos/replays/how-to-replay-from-a-blocks.log)
The `blocks.log` file contains all irreversible transactions on the blockchain. All instances of `nodeos` write irreversible blocks to the blocks.log file, which is located at the `data/blocks` directory relative to the `nodeos` directory. Using a `blocks.log` file to replay will allow you to start a `nodeos` instance, which recreates the entire history of the blockchain locally, without adding unnecessary load to the network.

- [Recover From snapshot](https://developers.eos.io/manuals/eos/v2.0/nodeos/replays/how-to-replay-from-a-snapshot)
Snapshot files can be created from a running `nodeos` instance. The snapshot contains the chain state for the block referenced when created. It is recommended to use snapshot files created from blocks that are irreversible. Using a snapshot file to replay allows you to quickly start a `nodeos` instance which has a full and correct chain state at a specified block number, but not a full history of transactions up to that block number. From that point on the `nodeos` instance will operate in the configured manner.

## Update EOSIO
### [Update node version](https://github.com/EOS-Jungle-Testnet/Node-Manual-Installation#2-update-eosio-software-to-new-version)

### Patch EOSIO

Although rare, emergency software releases may occur that require compiling a patched version of EOSIO. In these situations it is important that node operators respond quickly in applying the updates to ensure the security and stability of the network. 

We have provided you with a sample list of commands in order to patch EOSIO if this scenario occurs: 
```
mkdir -p ~/eosio && cd ~/eosio
git clone --recursive https://github.com/EOSIO/eos
cd ~/eosio/eos
git submodule update --init --recursive
[git checkout <branch>]  (optional)
git pull --recurse-submodules
git apply patch.diff
```

## Extra Work
- [Prune Blocks Logs using block-log utility](https://developers.eos.io/manuals/eos/v2.1/utilities/eosio-blocklog)
