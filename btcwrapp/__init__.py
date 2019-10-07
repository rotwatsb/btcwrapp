import os
from flask import Flask
from btcwrapp.lib import btc

def create_app():
    # create and configure the app
    # __name__ is the name of the current Python module
    # instance_relative_config tells the app that configuration files are relative to the
    # instance folder
    app = Flask(__name__, instance_relative_config=True)

    app.config.from_json('config/default.json')
    app.config.from_json('config/' + app.config['ENV'] + '.json')

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    @app.route('/bitcoin')
    def bitcoin():
        info = btc.rpc(
            method='getblockchaininfo',
            params=[]
        )['result']

        return info

    @app.route('/bitcoin/best-block')
    def bestblock():
        best_block_hash = btc.rpc(
            method='getblockchaininfo',
            params=[]
        )['result']['bestblockhash']

        info = btc.rpc(
            method='getblock',
            params=[best_block_hash]
        )['result']

        return info

    return app
