import 'package:flutter/material.dart';
//import 'main.dart';

class Setting extends StatefulWidget {
  final String title;
  Setting(Key key,this.title):super(key:key);
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      Text('side bar'),
    ),
    drawer: new Drawer(
      child: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:150,left: 18),
          child: Text('setting'),
        ),
        Padding(
          padding: const EdgeInsets.only(top:180,left: 18),
          child: Text('setting'),
        ),
        Padding(
          padding: const EdgeInsets.only(top:210,left: 18),
          child: Text('setting'),
        ),
        Padding(
          padding: const EdgeInsets.only(top:220,left: 18),
          child: Text('setting'),
        )
      ]
      ,)
    ),
    
    );
  }
}