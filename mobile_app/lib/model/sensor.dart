
// class Sensor{

  

//   Sensor.only({this.pm1_0, this.pm2_5, this.pm10, this.co2,this.voc,this.temp,this.humidity,this.cho2,this.co,this.o3,this.no2,this.time});
//   Sensor();
//   // String get id =>_id;
//   // String get pm1_0 =>_pm1_0;
//   // String get pm2_5 =>_pm2_5;
//   // String get pm10 =>_pm10;
//   // String get co2 =>_co2;
//   // String get voc =>_voc;
//   // String get temp =>_temp;
//   // String get hum =>_hum;
//   // String get cho2 =>_cho2;
//   // String get co =>_co;
//   // String get o3 =>_o3;
//   // String get no2 =>_no2;
//   // String get time =>_time;
 

//   // set id(String val) {
//   //   _id = val;
//   // }
//   // set pm1_0(String val) {
//   //   _pm1_0 = val;
//   // }

//   // set pm2_5(String val) {
//   //   _pm2_5 = val;
//   // }

//   // set pm10(String val) {
//   //   _pm10 = val;
//   // }

//   // set co2(String val) {
//   //   _co2 = val;
//   // }

//   // set voc(String val) {
//   //   _voc = val;
//   // }
//   // set temp(String val) {
//   //   _temp = val;
//   // }
//   // set hum(String val) {
//   //   _hum = val;
//   // }

//   // set cho2(String val) {
//   //   _cho2 = val;
//   // }

//   // set co(String val) {
//   //   _co = val;
//   // }
//   // set o3(String val) {
//   //   _o3 = val;
//   // }
//   // set no2(String val) {
//   //   _no2 = val;
//   // }

//   // set time(String val) {
//   //   _time = val;
//   // }



//    Map<String, dynamic> toMap() {
//     var map = Map<String, dynamic>();

//     map["pm1_0"] = pm1_0;
//     map["pm2_5"] = pm2_5;
//     map["pm10"] = pm10;
//     map["co2"] = co2;
//     map["voc"] = voc;
//     map["temp"]= temp;
//     map["humidity"] = humidity;
//     map["cho2"] = cho2;
//     map["co"] = co;
//     map["o3"] = o3;
//     map["no2"] = no2;
//     map["time"] = time;


//     return map;
//   }

//   Sensor.fromObject(dynamic o) {

//     this.pm1_0 = o["pm1_0"];
//     this.pm2_5 = o["pm2_5"];
//     this.pm10 = o["pm10"];
//     this.co2 = o["co2"];
//     this.voc = o["voc"];
//     this.temp = o["temp"];
//     this.humidity = o["humidity"];
//     this.cho2 = o["cho2"];
//     this.co = o["co"];
//     this.o3 = o["o3"];
//     this.no2 = o["no2"];
//     this.time = o["time"];
//   }

//   factory Sensor.fromJson(Map<String, dynamic> json) {
//     return Sensor.only(
//         pm1_0: json["pm1_0"] as String,
//         pm2_5: json["pm2_5"] as String,
//         pm10: json["pm10"] as String,
//         co2: json["co2"] as String,
//         voc: json["voc"] as String,
//         temp: json["temp"] as String,
//         humidity: json["humidity"] as String,
//         cho2: json["cho2"] as String,
//         co: json["co"] as String,
//         o3: json["o3"] as String,
//         no2: json["no2"] as String,
//         time: json["time"] as String);
//   }


// }
// Future<List<Sensor>> fetchSensor(Uri link) async {
//   final response = await http.get(link);

//   // Use the compute function to run parsePhotos in a separate isolate.
//   return compute(parseSensor, response.body);
// }

// // A function that converts a response body into a List<Photo>.
// List<Sensor> parseSensor(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<Sensor>((json) => Sensor.fromJson(json));
// }
//http://159.65.115.118/api/data
//http://159.65.115.118:8080/api/statss/3




