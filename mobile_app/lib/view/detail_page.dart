import 'package:flutter/material.dart';
import 'package:flutter_deneme/model/sensor.dart';
import 'package:flutter_deneme/model/sensor_model.dart';

class DetailPage extends StatefulWidget {
  Sensor sensor = new Sensor();
  DetailPage(this.sensor);
  

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
   
  _DetailPageState();
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.greenAccent,
       child: TextButton(child: Text(widget.sensor.cho2.toString()),onPressed: (){
         Navigator.pop(context);
       },),
    );
  }
}