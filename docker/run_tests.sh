#!/bin/bash

export PYTHONPATH=/project
export FLASK_APP=btcwrapp
export ENV=testing

pipenv install --dev
pipenv run pytest -vv

exit $?
