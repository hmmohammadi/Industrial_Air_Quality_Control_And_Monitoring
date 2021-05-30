import pymongo
from flask import Flask,jsonify,request, json
from datetime import datetime


myclient = pymongo.MongoClient('mongodb://159.65.115.118:27017/', username='admin', password='bitirme:)')
mydb = myclient['sensordb']
mycol = mydb["sensorcol"]

def main():

    y = mycol.find().sort('_id', -1).limit(3) # get last one 

    # x = mycol.find_one()
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
    for i in y:
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
    
    # print(o3)
    # print(no2)
    # print(co)
    print(humidity)

    print(time[0].split('T')[1].split('.')[0][:-3])
    
if __name__=="__main__":
    main()
    # import time

    # t = datetime.now()

    # print(t)