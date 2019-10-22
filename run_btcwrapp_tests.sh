#!/bin/bash

export RPC_USER=rpcuser
export RPC_PASSWORD=rpcpw
export RPC_CLIENT_HOST=btcwrapp

docker-compose build
docker-compose up --abort-on-container-exit --exit-code-from btcwrapp

exit $?
