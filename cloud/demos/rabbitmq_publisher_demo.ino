// Including necessary libraries
#include <WiFi.h>
#include <PubSubClient.h>
#include <Wire.h>
#include <ArduinoJson.h>



const char* ssid = "********";                 // Wi-Fi id is set
const char* password = "********";             // Wi-Fi password is set
const char* mqtt_server = "";      // Remote host ip address is set

// Creating Wi-Fi and Publisher object
WiFiClient espClient;
PubSubClient client(espClient);

long lastMsg = 0;      // Variable to  keep the time the last message was sent

void setup() {
  Serial.begin(115200);                    // To start the serial communication, baud_rate = 115200
  setup_wifi();                            // To set up the Wi-Fi
  client.setServer(mqtt_server, 1883);     // To set up the mqtt_server
}

// Function to connect to the local Wi-Fi via the board card Wi-Fi module
void setup_wifi() {
  delay(10);
  Serial.println();
  Serial.print("Connecting to "); 
  Serial.println(ssid);                          
  WiFi.begin(ssid, password);                 // Wi-Fi infos are set
  while (WiFi.status() != WL_CONNECTED) {     // Wait until ESP32 is connected to Wi-Fi
    delay(500); 
    Serial.print(".");                       
  }

  Serial.println("");
  Serial.println("WiFi connected"); 
  Serial.println("IP address: ");   
  Serial.println(WiFi.localIP());             // print the local IP address
} 


// To reconnect to Wi-Fi in case of connection failure
void reconnect(){
  while (!client.connected()) {
      client.connect("esp32", "********", "********");
      delay(5000);
  }
}

void loop() {
  if (!client.connected()) {
    reconnect();              // Reconnect to Wi-Fi in case of connection failure
  }
  client.loop();

  // serialization
  StaticJsonDocument<200> doc;         // A json document is created 
  doc["sensor"] = "dht11";             // The sensor name is set
  doc["temperature"] = 18.01;          // The temperature value is set
  char buffer[256];                    // A buffer is created, buffer_size = 256
  serializeJson(doc, buffer);          // Json document is serialized in buffer

  
  long now = millis();                      // Take the current time
  if (now - lastMsg > 5000) {
    lastMsg = now;            
    client.publish("sensors.data", buffer); // Publish the serialized data to rabbitmq server
  }
}
