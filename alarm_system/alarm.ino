#include <WiFi.h>
#include <PubSubClient.h>
#include <Wire.h>
#include <ArduinoJson.h>

// Wi-Fi settings
const char* ssid = "mohamed";            
const char* password = "12345678";        
const char* mqtt_server = "159.65.115.118";  

// Buzzer settings
const int freq = 2000;
const int channel = 0;
const int resolution = 8;
const int buzzerPin = 4;

// Wifi & mqtt client objects
WiFiClient espClient; 
PubSubClient client(espClient);

// Declaration of functions 
void wifiSetup();
void alarmSetup();
inline void alert();
void callback(char*, byte*, unsigned int);

// General setup
void setup() {
  Serial.begin(9600);  
  wifiSetup();
  alarmSetup();
  client.setServer(mqtt_server, 1883); 
  client.setCallback(callback);
}

// loop function
void loop() {
  if (!client.connected()) {  // connect to rabbitmq brocker in case of disconnection
    connect_client();
  }
  delay(3000);
  client.loop();
}

// Wi-Fi setup function
void wifiSetup() {
  delay(10);
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);              
  
  while (WiFi.status() != WL_CONNECTED) {   // Wait until ESP32 Wi-Fi connection is established
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());          // Print out the local IP address
}

// Rabbitmq  connection function
void connect_client(){ 
  if (client.connect("esp32-1", "admin", "bitirme2021")) { // connection is established
      Serial.println("connected");   
      client.subscribe("alarm/data");                      // subscribe to alarm/data topic  
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());                        
    }
}

// alarm setup function
void alarmSetup() {
  ledcSetup(channel, freq, resolution);
  ledcAttachPin(buzzerPin, channel);
}

// alert function
inline void alert() {
  ledcWriteTone(channel, freq);    
  for (int dutyCycle = 0; dutyCycle <= 255; dutyCycle=dutyCycle+10){   // resolution 8 ==> 0-255 dutyCycle
     ledcWrite(channel, dutyCycle);
     delay(3000);
  }
} 

// callback function
void callback(char* topic, byte* message, unsigned int length) {    
  alert();
}
