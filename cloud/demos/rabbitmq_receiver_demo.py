from time import time, sleep
from datetime import datetime
import threading
import pymongo
import json
import pika

def main():
   
   # rabbitmq setup
   credentials = pika.PlainCredentials("", "")
   connection = pika.BlockingConnection(pika.ConnectionParameters('',
                                                                   5672,
                                                                   '/',
                                                                   credentials))
   channel = connection.channel()

   # mongodb setup
   mongo_client = pymongo.MongoClient(
       'mongodb://159.65.115.118:27017/', username='admin', password='bitirme:)')
   mydb = mongo_client['sensordb']
   mycol = mydb["sensorcol"]

   # subscriber callback and mongodb insert 
   def callback(ch, method, properties, msg):
       # print(" [X] Received %r" % body)
       # print("RECEIVE: " + str(msg.decode("utf-8")))
       message = json.loads(msg.decode("utf-8"))
       now = datetime.now()
       time = now.strftime("%H:%M:%S")
       message["time"] = time
       x = mycol.insert_one(message)
       #print(message)
       # print(x)
      
   
   # consumer subscription
   channel.basic_consume(queue='sensorsQueue',
                         on_message_callback=callback,
                         auto_ack=True)


   print(' [*] Waiting for messages. To exit press CTRL+C')
   channel.start_consuming()


if __name__ == '__main__':
   try:
      main()
   except KeyboardInterrupt:
        print('Interrupted !!')
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)
