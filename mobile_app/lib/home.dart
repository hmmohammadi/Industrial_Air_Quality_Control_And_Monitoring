import 'package:flutter/material.dart';
import 'package:flutter_deneme/view/prev_page.dart';

/// This is the stateful widget that the main application instantiates.
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static String sensor = "";
  static Color color = Colors.pink;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    VeriGoster("temp"),
    VeriGoster("humidity"),
    VeriGoster("pm2_5"),
    VeriGoster("co2"),
    VeriGoster("voc"),
    VeriGoster("cho2"),
    VeriGoster("co"),
    VeriGoster("o3"),
    VeriGoster("no2"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Temperature',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_bolt),
            label: 'Humidity',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'PM2.5',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_bolt),
            label: 'CO2',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'VOC',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_bolt),
            label: 'CHO2',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'CO',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_bolt),
            label: 'O3',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'NO2',
            backgroundColor: Colors.red,
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
