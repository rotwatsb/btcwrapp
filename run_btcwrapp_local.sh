#!/bin/bash

export FLASK_APP=btcwrapp
export RPC_USER=localdev
export RPC_PASSWORD=localdev
export RPC_BITCOIN_HOST=localhost

pipenv run python run_btcwrapp_wsgi.py
