
 #!/usr/bin/env bash
echo "Claiming Block Producer Rewards";
date

#Unlock wallet
cleos wallet unlock -n claim --password $WALLET_PWD #Uses local ENV variable
#Claim
cleos push action eosio claimrewards '{"owner":"blockproduce"}' -p blockproduce@claimer #Add your own account name here
cleos wallet lock -n claim