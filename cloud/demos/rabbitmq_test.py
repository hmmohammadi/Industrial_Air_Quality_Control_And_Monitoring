import pika
import json
from random import randint
from time import time, sleep

import sys
import os


def main():
    credentials = pika.PlainCredentials('****', '****')
    connection = pika.BlockingConnection(pika.ConnectionParameters('******',
                                                                   5672,
                                                                   '/',
                                                                   credentials))
    channel = connection.channel()
    #channel.queue_declare(queue='sensorsQueue')

    def generate_values():
        return randint(15, 15), randint(3, 11)*0.33

    t1 = time()
    while True:
        if (int(time() - t1) >= 5):
            tp, c = generate_values()
            values = '''
                     {{ 
                      "time": "",
		      "sensors":
		       [{{
                          "temperature": {temp},
		          "co2": {co2}
		       }}]
		     }}
	           '''
            values = values.format(temp=tp, co2=c)
            values = json.loads(values)

            channel.basic_publish(exchange='amq.topic',
                                  routing_key='sensors.data',
                                  body=json.dumps(values))
        sleep(2)

    connection.close()


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print('Interrupted !!')
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)
