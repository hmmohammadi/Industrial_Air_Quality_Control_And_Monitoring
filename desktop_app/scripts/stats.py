from flask.wrappers import Response
import requests
import json
import time


class Stats(object):
    def __init__(self, count=0) -> None:
        super().__init__()
        self.count = count
        self.response = 0
        self.tempreture = 0
        self.co = 0
        self.cho2 = 0
        self.co2 = 0
        self.humidity = 0
        self.no2 = 0
        self.co = 0
        self.o3 = 0
        self.pm2_5 = 0
        self.pm1_0 = 0
        self.time = 0
        self.pullStats(self.count)
    

    def pullStats(self, count):
        if self.count != count:
            self.count = count
        url = f"http://159.65.115.118:8080/api/stats/{self.count}"
        try:
            response = requests.get(url)
            self.response = json.loads(response.text)
            self.parse()
        except ConnectionError as e:
            print(e)
    
    def parse(self):
        self.tempreture = self.response['temprature']
        self.co = self.response['co']
        self.cho2 = self.response['cho2']
        self.co2 = self.response['co2']
        self.humidity = self.response['humidity']
        self.no2 = self.response['no2']
        self.co = self.response['co']
        self.o3 = self.response['o3']
        self.pm1_0 = self.response['pm1_0']
        self.time = self.response['time']
        self.pm2_5 = self.response['pm2_5']
        self.time = self.response['time']


if __name__=="__main__":

    stats = Stats()
    stats.pullStats(3)
    print(stats.tempreture)
