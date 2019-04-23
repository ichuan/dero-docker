#!/usr/bin/env bash

set -e
wallet_file=/opt/coin/wallet

mkdir -p /opt/coin/data

if test $# -eq 0; then
  # generate wallet if needed
  [ ! -f $wallet_file ] && {
    # interactive create wallet
    /opt/dero-wallet-cli-linux-amd64 --wallet-file $wallet_file --password ""
  }
  # start node
  /opt/derod-linux-amd64 --data-dir /opt/coin/data --rpc-bind 0.0.0.0:20206 </dev/null &
  # wallet api
  exec /opt/dero-wallet-cli-linux-amd64 --wallet-file $wallet_file --password "" --unlocked --daemon-address 127.0.0.1:20206 --rpc-server --rpc-bind 0.0.0.0:20209
else
  exec $@
fi
