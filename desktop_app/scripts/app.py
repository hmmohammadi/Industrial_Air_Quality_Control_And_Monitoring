from flask import Flask
from werkzeug.routing import BaseConverter

app = Flask(__name__)

class RegexConverter(BaseConverter):
        def __init__(self, url_map, *items):
                super(RegexConverter, self).__init__(url_map)
                self.regex = items[0]

app.url_map.converters['regex'] = RegexConverter

# To get all URLs ending with "/number"
@app.route("/<regex('.*\/([0-9]+)'):param>/")
def go_to_one(param):
    return param.split("/")[-1]

# # To get all URLs ending with a number
# @app.route("/<regex('.*([0-9]+)'):param>/")
# def go_to_one(param):
#     return param.split("/")[-1]

# To get all URLs without a number
@app.route("/<regex('[^0-9]+'):param>/")
def go_to_two(param):
    return param

@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    app.run(debug=True)