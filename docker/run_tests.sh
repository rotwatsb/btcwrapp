#!/bin/bash

export PYTHONPATH=/project
export FLASK_ENV=testing

pipenv install --dev
pipenv run pytest -vv

exit $?
