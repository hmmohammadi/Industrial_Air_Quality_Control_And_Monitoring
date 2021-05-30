import pymongo

'''
	Saves data that taken from API to docker mongodb.
'''

class MongoDB(object):
    '''
        data     :
        url      :
        username :
        password :

    '''
    def __init__(self, data=None, url="mongodb://localhost:27017/", username='root', password='bitirme', db_name="bitirme", collection='api') -> None:
        super().__init__()
        self.data = data
        self.client  = pymongo.MongoClient(url, username=username, password=password)
        self.db = self.client[db_name]
        self.col = self.db[collection]
    

    def add_to_collec(self, data=None):
        if data != None and self.data != data:
            self.data = data
        
        self.col.insert_one(self.data)





def main():
    data = {'coord': {'lon': 50, 'lat': 50}, 'list': [{'main': {'aqi': 2}, 'components': {'co': 196.93, 'no': 0.03, 'no2': 0.17, 'o3': 110.15, 'so2': 1.09, 'pm2_5': 1.11, 'pm10': 1.17, 'nh3': 0.2}, 'dt': 1620295200}]}
    mongo = MongoDB(data=data)
    mongo.add_to_collec()
# x = col.insert_one(data)

if __name__=="__main__":
    main()
