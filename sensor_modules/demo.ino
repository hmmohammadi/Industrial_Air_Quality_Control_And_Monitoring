#include <WiFi.h>
#include <PubSubClient.h>
#include <ArduinoJson.h>
#include "sensor.h"

// UART1 Pins 
#define RXD2 16
#define TXD2 17  

// Wi-Fi settings
const char* ssid = "mohamed";                 
const char* password = "12345678";            
const char* mqtt_server = "159.65.115.118";   

// Wi-Fi and mqtt client objects
WiFiClient esp32;
PubSubClient client(esp32);

// 
uint8_t buf[26] = { 0 };
uint8_t idx = 0;
bool parse_flag = 0;

// function to send command to serial
void send_serial(const uint8_t* buf, int size)
{
    Serial2.write(buf, size); 
} 

// sensor module instance
sensor_ins new_sens = NULL;

// General setup
void setup() {

    Serial.begin(9600);
    setup_wifi();                            
    client.setServer(mqtt_server, 1883);
     
    Serial2.begin(9600, SERIAL_8N1, RXD2, TXD2);                // start serial comminucation
    new_sens = create_new_sensor(send_serial, buf);             // create sensor module instance

    if (!new_sens)                                              // In case of NULL is returned
    {
        Serial.println("Bellek yetersiz");
    }

    delay(2000);
    
    Serial.println("Haberlesme Basladi");                
}

// Wi-Fi setup function
void setup_wifi() {
  delay(10);
  Serial.println();
  Serial.print("Connecting to "); 
  Serial.println(ssid);                          
  WiFi.begin(ssid, password);                 
  while (WiFi.status() != WL_CONNECTED) {     // Wait until the Wi-Fi connection is established
    delay(500); 
    Serial.print(".");                       
  }

  Serial.println("");
  Serial.println("WiFi connected"); 
  Serial.println("IP address: ");   
  Serial.println(WiFi.localIP());             // Print out the local IP address
}

// Establish the Rabbitmq connection over mqtt protocol
void reconnect(){ 
  while (!client.connected()) {
      client.connect("esp32", "admin", "bitirme2021");
      delay(5000);
  }
}

//loop function
void loop() {

    static uint32_t zaman = 0;

    if (millis() - zaman > 5*60*1000)   // every 5 minutes
     {
        send_request(new_sens);        // send new request every 5 minutes  
        zaman = millis();  
    }

    if (!client.connected()) {
         reconnect();              // Reconnect to Wi-Fi in case of disconnection
    }
    client.loop();                 // Keep mqtt client working
    
    StaticJsonDocument<200> doc;   // Json document to serialize sensor data

    if (parse_flag)                // In case of parse_flag is set
    {
        parse_flag = 0;         
        idx = 0;                                  // start by the first data
        doc["PM1_0"] = get_pm1_0();               // get gaz data
        doc["PM2_5"] =  get_pm2_5();
        doc["PM10"] = get_pm10();
        doc["C02"] = get_co2();
        doc["VOC"] = get_voc();
        doc["TEMP"] = get_temperature();
        doc["HUM"] = get_humidity();
        doc["CHO2"] = get_ch2o();
        doc["CO"] = get_co();
        doc["O3"] = get_o3();
        doc["NO2"] = get_no2();
        char buffer[256];           
        serializeJson(doc, buffer);               // serialize data 
        client.publish("sensors.data", buffer);   // publish serialized data on sensors.topic
    }

    if (Serial2.available() > 0)                  // if data there is any incoming data (serial)
    {       
        uint8_t data  = Serial2.read();           // read data
        buf[idx++] = data; 
        if (idx >= 26)                            // last index is reached
        {                 
            parse_data(new_sens);                 // parse the received data
            idx = 0;                              // start index 
            parse_flag = 1;                       // set the flag
        }
    }
}
