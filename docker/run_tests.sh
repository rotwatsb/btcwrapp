#!/bin/bash

export PYTHONPATH=/project
export ENV=testing

pipenv install --dev
pipenv run pytest -vv

exit $?
