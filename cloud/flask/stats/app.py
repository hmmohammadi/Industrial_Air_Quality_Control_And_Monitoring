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


@app.route('/api/stats/<int:count>', methods=['GET'])
def get_stats(count):
    if count > 0:

        data = mycol.find().sort('_id', -1).limit(count) # Get the last N records from mongodb
        pm1_0 = []
        pm2_5 = []
        pm10 = []
        co2 = []
        temprature = []
        humidity = []
        cho2 = []
        co = []
        no2 = []
        o3 = []
        time = []
        for i in data:
            pm1_0.append(i['PM1_0'])
            pm2_5.append(i['PM2_5'])
            pm10.append(i['PM10'])
            co2.append(i['C02'])
            temprature.append(i['TEMP'])
            humidity.append(i['HUM'])
            cho2.append(i['CHO2'])
            co.append(i['CO'])
            o3.append(i['O3'])
            no2.append(i['NO2'])
            time.append(i['time'])
    
        return jsonify(pm1_0=pm1_0,pm2_5=pm2_5, pm10=pm10, co2=co2, temprature=temprature, humidity=humidity, cho2=cho2,co=co, o3=o3, no2=no2,time=time)
  return "Lütfen sıfırdan büyük bir değer giriniz....!!!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True, use_reloader=True)
