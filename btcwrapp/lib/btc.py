import os, requests

def rpc(method, params):
    response = requests.post(
        "http://%s:8332"%(
            os.environ['RPC_BITCOIN_HOST']
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
