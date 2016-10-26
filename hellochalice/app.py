from chalice import Chalice, BadRequestError, NotFoundError
import urlparse

app = Chalice(app_name='hellochalice')
app.debug = True

CITIES_TO_STATE = {
        'seattle': 'WA',
        'portland': 'OR',
        }

OBJECTS = {}
 
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

@app.route('/resource/{value}', methods=['PUT'])
def put_test(value):
    return {"value": value}

@app.route('/objects/{key}', methods=['GET', 'PUT'])
def myobject(key):
    request = app.current_request
    if request.method == 'PUT':
        OBJECTS[key] = request.json_body
    elif request.method == 'GET':
        try:
            return {key: OBJECTS[key]}
        except KeyError:
            raise NotFoundError(key)

@app.route('/introspect')
def introspect():
    return app.current_request.to_dict()

@app.route('/content', methods=['POST'], content_types=['application/x-www-form-urlencoded'])
def content():
    parsed = urlparse.parse_qs(app.current_request.raw_body)
    return { 'states': parsed.get('states', []) }
