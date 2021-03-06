import os
from flask import Flask
from btcwrapp.lib import btc

def create_app():
    # create and configure the app
    # __name__ is the name of the current Python module
    app = Flask(__name__, instance_relative_config=False)

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    @app.route('/blockchain')
    def get_blockchain_info():
        info = btc.rpc(
            method='getblockchaininfo',
            params=[]
        )['result']

        return info

    @app.route('/block/<string:block_hash>')
    def get_block(block_hash):
        block = btc.rpc(
            method='getblock',
            params=[block_hash]
        )['result']

    @app.route('/block')
    def get_best_block():
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
