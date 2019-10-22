#!/bin/bash

export ENV=development
export FLASK_APP=btcwrapp
export RPC_USER=localdev
export RPC_PASSWORD=localdev

pipenv run python run_btcwrapp_wsgi.py
