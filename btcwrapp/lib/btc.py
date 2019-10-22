import os, requests
from config2.config import config

def rpc(method, params):
    response = requests.post(
        "http://%s:%s"%(
            config['bitcoin-service']['domain'],
            config['bitcoin-service']['port']
        ),
        json = {
            'jsonrpc': '1.0',
            'method': method,
            'params': params
        },
        auth = requests.auth.HTTPBasicAuth(
            os.environ['RPC_USER'],
            os.environ['RPC_PASSWORD']
        )
    )

    return response.json();
