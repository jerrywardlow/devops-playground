from chalice import Chalice, BadRequestError

app = Chalice(app_name='hellochalice')
app.debug = True

CITIES_TO_STATE = {
        'seattle': 'WA',
        'portland': 'OR',
        }

@app.route('/')
def index():
    return {'hello': 'world'}

@app.route('/cities/{city}')
def state_of_city(city):
    try:
        return {'state': CITIES_TO_STATE[city]}
    except KeyError:
        raise BadRequestError("Unknown city '%s', valid choices: %s" % (
                                city, ', '.join(CITIES_TO_STATE.keys())))
