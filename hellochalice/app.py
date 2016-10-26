from chalice import Chalice

app = Chalice(app_name='hellochalice')


@app.route('/')
def index():
    return {'hello': 'world'}

