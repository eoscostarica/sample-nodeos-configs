# Jungle testnet Node

## Goal

Set up a node on the jungle testnet

## Workshop deliverables

The student must send:
1. The chosen producer name.
2. The Nodeos generated log files.

## Workshop instructions

To start a Jungle 3 node you need to install the EOSIO software. You can compile from sources or install from precompiled binaries:

[Jungle Testnet](https://github.com/EOS-Jungle-Testnet/Node-Manual-Installation#3-install-jungle30-testnet-node-manual)

Chain ID: `2a02a0053e5a8cf73a56ba0fda11e4d92e0238a4a2aa74fccf46d5a910746840`
Based on tag: v2.1.0

## Install EOSIO


## Configure Jungle Testnet

```bash
    mkdir /opt/Jungle3Testnet
    cd /opt/Jungle3Testnet
    git clone https://github.com/EOS-Jungle-Testnet/Node-Manual-Installation.git ./

```

- In case you use a different data-dir folders, please make sure you edit all paths in files cleos.sh, start.sh, stop.sh, config.ini, Wallet/start_wallet.sh, Wallet/stop_wallet.sh

- Choose your producer name (12 symbols length only,  a-z 1-5 allowed only) and create your own EOS key pair. You can create the key pair using cleos command `./cleos.sh create key`, using Scatter or <a target="_blank" href="https://nadejde.github.io/eos-token-sale/">here</a>.


- If non BP node: use the same config, just comment out rows with producer-name and signature-provider

- Edit config.ini:
  - server address: p2p-server-address = ENRT_YOUR_NODE_EXTERNAL_IP_ADDRESS:9876

  - if BP: your producer name: producer-name = YOUR_BP_NAME
  - if BP: add producer keypair for signing blocks (this pub key should be used in regproducer action):
  signature-provider = YOUR_PUB_KEY_HERE=KEY:YOUR_PRIV_KEY_HERE
  - replace p2p-peer-address list with fresh generated on monitor site: http://monitor3.jungletestnet.io/#p2p
  - Check chain-state-db-size-mb value in config, it should be not bigger than you have RAM:
    chain-state-db-size-mb = 16384

- Open TCP Ports (8888, 9876) on your firewall/router


- Start wallet, run
```
cd /opt/Jungle3Testnet
./Wallet/start_wallet.sh
```

**First run should be with --delete-all-blocks and --genesis-json**
```
./start.sh --delete-all-blocks --genesis-json genesis.json
```
Check logs stderr.txt if node is running ok.


- Create your wallet file
```
./cleos.sh wallet create --to-file pass.tx
```
Your password will be in pass.txt it will be used when unlock wallet


- Unlock your wallet
```
./cleos.sh wallet unlock
```
enter the wallet password.


- Import your key
```
./cleos.sh wallet import
```
Enter your private key



- Check if you can access you node using link http://you_server:8888/v1/chain/get_info (<a href="http://jungle3.cryptolions.io/v1/chain/get_info" target="_blank">Example</a>)
