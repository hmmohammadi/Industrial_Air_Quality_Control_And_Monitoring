from flask import Flask,jsonify,request, json
import pymongo
from flask_bcrypt import Bcrypt
import jwt
from functools import wraps
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

app.config['DEBUG'] = True
#app.config['SECRET_KEY'] = 'bitirme:)'
bcrypt = Bcrypt()

myclient = pymongo.MongoClient('mongodb://159.65.115.118:27017/', username='admin', password='bitirme:)')
mydb = myclient['sensordb']
mycol = mydb["sensorcol"]

def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.args.get('token')

        if not token:
            return jsonify({'message': 'Token is missing'}), 403

        try:
            jwt.decode(token, app.config['SECRET_KEY'])
        except Exception as ex:

            return jsonify({'message': ex}), 403

        return f(*args, **kwargs)
    return decorated


@app.route('/api/data', methods=['GET'])
def get_datas():
    data=[]
    y = mycol.find().sort('_id', -1).limit(1) # get last one
    data = []
    for x in y:
        data = x


            
    return jsonify(pm1_0=data['PM1_0'],
            pm2_5=data['PM2_5'], pm10=data['PM10'], co2=data['C02'],
            voc=data['VOC'], temprature=data['TEMP'], humidity=data['HUM'], cho2=data['CHO2'],
            co=data['CO'], o3=data['O3'], no2=data['NO2'],time=data['time'])

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True, use_reloader=True)
