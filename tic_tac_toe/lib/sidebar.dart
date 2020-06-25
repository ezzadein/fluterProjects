
import 'package:flutter/material.dart';
import 'home_page.dart';
enum SingingCharacter { lafayette, jefferson }
class SideBar  extends StatefulWidget { 

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  SingingCharacter _character = SingingCharacter.lafayette;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:50),
      child: Column(
      children: <Widget>[
        ListTile(
          title: const Text('against computer'),
          leading: Radio(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character=value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('against human'),
          leading: Radio(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    ),
    );
  }
}