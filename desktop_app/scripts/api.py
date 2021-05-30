from flask.wrappers import Response
from .mongo import MongoDB
import requests
import json
import time

'''
	Getting Data from openweathermap site over api
'''

def api():
    key = "secret"
    lat = 50
    lon = 50
    url = f"https://api.openweathermap.org/data/2.5/air_pollution?lat={lat}&lon={lon}&appid={key}"

    try:
        response = requests.get(url)
        return json.loads(response.text)
    except ConnectionError as e:
        print(e)

def getgas():
    data = api()
    data = data["list"][0]['components']
    return data

def main():
    n = 0
    mongo = MongoDB()
    while n < 20:
        data  = api()
        mongo.add_to_collec(data)
        time.sleep(5)
        n += 1
    # pass


def api(url):

    try:
        response = requests.get(url)
        return json.loads(response.text)
    except ConnectionError as e:
        print(e)
    

def get():
    # url 
    data = api(url="http://159.65.115.118/api/data")
    print(data)
    return data
    # print(data)






if __name__=="__main__":
    # api()
    # main()
    get()
    pass
