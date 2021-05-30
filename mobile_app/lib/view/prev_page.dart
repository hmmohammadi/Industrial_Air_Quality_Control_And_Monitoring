import 'package:circular_usage_indicator/circular_usage_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_deneme/model/sensor_model.dart';
import 'package:flutter_deneme/view/detail_page.dart';

class VeriGoster extends StatefulWidget {
  final String sensor;

  VeriGoster(this.sensor);

  @override
  _VeriGosterState createState() => _VeriGosterState();
}

class _VeriGosterState extends State<VeriGoster> {
  Future<Sensor> futureSensor;

  @override
  void initState() {
    super.initState();
    futureSensor = fetchSensor();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Sensor>(
      future: futureSensor,
      builder: (context, snapshot) {
        var data;
        var limit;
        var birim;
        // dynamic x = snapshot.data;
        if (snapshot.hasData) {
          if (widget.sensor == "pm2_5") {
            data = snapshot.data.pm2_5;
            limit = 1000;
            birim="μg/m3";
          } else if (widget.sensor == "co2") {
            data = snapshot.data.co2;
            limit = 5000;
            birim=" PPM";
          } else if (widget.sensor == "voc") {
            data = snapshot.data.voc;
            limit = 3;
            birim="  Grade";
          } else if (widget.sensor == "temp") {
            data = snapshot.data.temp;
            limit = 65;
            birim=" ℃";
          } else if (widget.sensor == "cho2") {
            data = snapshot.data.cho2;
            limit = 6.250;
            birim="  mg/m3";
          } else if (widget.sensor == "co") {
            data = snapshot.data.co;
            limit = 500;
            birim="  PPM";
          } else if (widget.sensor == "o3") {
            data = snapshot.data.o3;
            limit = 10;
            birim=" PPM";
          } else if (widget.sensor == "no2") {
            data = snapshot.data.no2;
            limit = 9.9;
            birim=" PPM";
          } else if (widget.sensor == "humidity") {
            data = snapshot.data.humidity;
            limit = 100;
            birim=" RH";
          }
          double percentage =(double.parse(data)/limit)*100;
          percentage = percentage.roundToDouble();
         double progress= percentage/100;
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://cdn.wallpapersafari.com/55/58/Mt3QVP.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 6)),
                CircularUsageIndicator(
                  elevation: percentage*2,
                  backgroundColor: Colors.blueAccent,
                  borderColor: Colors.transparent,
                  progressValue:progress
                      , // progress value from 0.0 to 1.0
                  progressLabelStyle: TextStyle(
                    // change style for percentage text.
                    fontSize: 60.0,
                    color: Colors.transparent,
                    fontWeight: FontWeight.w400,
                  ),
                  progressColor: Color(0xFF023A5C),
                  size: 300,
                  borderWidth: 1.0,
                  // comment children if you the percentage to show up as a label
                  children: [
                    // if there are children widgets then the percentage label will not show up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          widget.sensor.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "% $percentage",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    Text(data+" "+birim,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),)
                  ],
                ),

              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://cdn.wallpapersafari.com/55/58/Mt3QVP.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child:Container(height:MediaQuery.of(context).size.height / 6, child: CircularProgressIndicator(),),
            );
      },
    );
  }
}
