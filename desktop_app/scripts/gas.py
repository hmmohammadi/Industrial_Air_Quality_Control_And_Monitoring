# from .mongo import MongoDB

from .api import api, getgas, main, get



class Gas(object):
    '''
    Pourpose of Gas class is provide 
        - data from WebService
    '''
    def __init__(self):
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
        self.gaslist = []
        self.data = {}
    


    def parse(self):
        self.tempreture = self.data['temprature']
        self.co = self.data['co']
        self.cho2 = self.data['cho2']
        self.co2 = self.data['co2']
        self.humidity = self.data['humidity']
        self.no2 = self.data['no2']
        self.co = self.data['co']
        self.o3 = self.data['o3']
        self.pm2_5 = self.data['pm2_5']
        self.pm1_0 = self.data['pm1_0']
    
    def update(self):
        self.data = get()
        self.gaslist = list(self.data.values())
        









if __name__=="__main__":

    gas = Gas()
    gas.update()

    print(type(gas.gaslist))






