from waitress import serve
import btcwrapp

app = btcwrapp.create_app()
print(app.config)
listen = "*:%s"%(
    app.config['PORT']
)

serve(app, listen=listen)
