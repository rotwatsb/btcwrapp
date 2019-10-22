from waitress import serve
import btcwrapp
from config2.config import config

app = btcwrapp.create_app()

listen = "*:%s"%(config['port'])

serve(app, listen=listen)
