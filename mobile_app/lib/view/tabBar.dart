import 'package:flutter/material.dart';
import 'package:flutter_deneme/view/prev_page.dart';

class RoomSettingsChooserPage extends StatefulWidget {
  RoomSettingsChooserPage({Key key}) : super(key: key);

  @override
  _RoomSettingsChooserPageState createState() =>
      _RoomSettingsChooserPageState();
}

class _RoomSettingsChooserPageState extends State<RoomSettingsChooserPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
int _index;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 9, vsync: this);
    _index= 1;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _index,
        length: 9,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: new AppBar(
            toolbarHeight: 48,
            bottom: new TabBar(
                isScrollable: true,
                controller: _controller,
                tabs: <Tab>[
                  new Tab(text: "Temp"),
                  new Tab(text: "Humidity"),
                  new Tab(text: "PM2.5"),
                  new Tab(text: "CO2"),
                  new Tab(text: "VOC"),
                  new Tab(text: "CHO2"),
                  new Tab(text: "CO"),
                  new Tab(text: "O3"),
                  new Tab(text: "NO2"),
                ]),
          ),
          body: new TabBarView(
            controller: _controller,
            children: <Widget>[
              VeriGoster("temp"),
              VeriGoster("humidity"),
              VeriGoster("pm2_5"),
              VeriGoster("co2"),
              VeriGoster("voc"),
              VeriGoster("cho2"),
              VeriGoster("co"),
              VeriGoster("o3"),
              VeriGoster("no2"),
            ],
          ),
        ));
  }
}
