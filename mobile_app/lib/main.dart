import 'package:flutter/material.dart';
import 'package:flutter_deneme/home.dart';
import 'package:flutter_deneme/model/sensor_model.dart';
import 'package:flutter_deneme/view/prev_page.dart';
import 'package:flutter_deneme/view/tabBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
    
      ),
      home: RoomSettingsChooserPage(),
    );
  }
}

