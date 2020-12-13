#!/bin/bash
rm -r ~/.pofecli
rm -r ~/.pofed

./pofed init pofe --chain-id pofe

./pofecli config keyring-backend test
./pofecli config chain-id pofe
./pofecli config output json
./pofecli config indent true
./pofecli config trust-node true

./pofecli keys add user1
./pofecli keys add user2
./pofed add-genesis-account $(./pofecli keys show user1 -a) 1000token,100000000stake
./pofed add-genesis-account $(./pofecli keys show user2 -a) 500token

./pofed gentx --name user1 --keyring-backend test

./pofed collect-gentxs 