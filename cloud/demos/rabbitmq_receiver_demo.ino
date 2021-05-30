// Including necessary libraries
#include <WiFi.h>
#include <PubSubClient.h>
#include <Wire.h>
#include <ArduinoJson.h>

const char* ssid = "*********";            // Wi-Fi id is set   
const char* password = "*********";        // Wi-Fi password is set
const char* mqtt_server = "165.22.88.25";  // Remote host ip address is set

// Creating Wi-Fi and Publisher object
WiFiClient espClient; 
PubSubClient client(espClient);

void setup() {
  Serial.begin(115200);                    // To start the serial communication, baud_rate = 115200             
  setup_wifi();                            // To set up the Wi-Fi
  client.setServer(mqtt_server, 1883);     // To set up the mqtt_server 
  client.setCallback(callback);            // Callback function is set
}

// Function to connect to the local Wi-Fi via the board card Wi-Fi module
void setup_wifi() {
  delay(10);
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);               // Wi-Fi infos are set
  
  while (WiFi.status() != WL_CONNECTED) {   // Wait until ESP32 is connected to Wi-Fi
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());          // print the local IP address
}

/*
 * void callback(char* topic, byte* message, unsigned int length) 
 * 
 * this function is called when subscribed to the topic
 * params:      char *topic: the name of the topic to subscribe to
 *              byte* message: take the comming message
 *              unsigned int length: length of the buffer
 */

void callback(char* topic, byte* message, unsigned int length) {  
  Serial.print("Message: ");
  StaticJsonDocument<256> doc;                  // A json document is created
  deserializeJson(doc, message, length);        // comming data is deserialized
  const char* sensor = doc["sensor"];           // sensor name is extracted from the document
  long temp = doc["temperature"];               // temperature value is extracted from the document

  Serial.print("Sensor:  ");
  Serial.println(sensor);                      // sensor name is printed to the serial monitor
  Serial.print("Temperature:  ");              
  Serial.print(temp);                          // temperature value is printed to the serial monitor
  Serial.println(" *C");
}

// To connect to rabbitmq server and subscribe to the "sensor/data" topic
void connect_client(){ 
  if (client.connect("esp32-1", "*********", "*********")) {
      Serial.println("connected");
      client.subscribe("sensors/data");  
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
    }
}

void loop() {
  if (!client.connected()) {
    connect_client();
  } 
  delay(3000);
  client.loop();               // the subscriber will be listening on the topic for ever
}
