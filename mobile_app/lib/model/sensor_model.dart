
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

Future<Sensor> fetchSensor() async {
  final response =
      await http.get(Uri.parse('http://159.65.115.118/api/datas'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Sensor.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Sensor {

  final String pm1_0,pm2_5,pm10,co2,voc,temp,humidity,cho2,co,o3,no2;
  final String time;

  Sensor({
 this.pm1_0,  this.pm2_5,  this.pm10,  this.co2, this.voc, this.temp, this.humidity, this.cho2, this.co, this.o3, this.no2, this.time
  });

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
        pm1_0: json['pm1_0'] ,
        pm2_5: json['pm2_5'] ,
        pm10: json['pm10'] ,
        co2: json['co2'] ,
        voc: json['voc'] ,
        temp: json['temp'] ,
        humidity: json['humidity'] ,
        cho2: json['cho2'] ,
        co: json['co'] ,
        o3: json['o3'] ,
        no2: json['no2'] ,
        time: json['time']);
  }
}



