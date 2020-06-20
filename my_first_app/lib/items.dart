//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
//import 'setting.dart';


class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  final _suggestions = <WordPair>[];
  Widget _draw(){
    return Drawer(child: 
       ListView(children:<Widget>[
                UserAccountsDrawerHeader(
          accountName: Text("EzzU"),
          accountEmail: Text("ezzadeinol@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor:
                Theme.of(context).platform == TargetPlatform.iOS
                    ? Colors.blue
                    : Colors.white,
            child: Text(
              "E",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
          ListTile(
        title: Text("Ttem 1"),
        trailing: Icon(Icons.arrow_forward),
      ),
      ListTile(
        title: Text("Item 2"),
        trailing: Icon(Icons.arrow_forward),
      ),

       ])
       ,);
  }
  Widget _buildRow(WordPair pair){
    return ListTile(title: Text(pair.asPascalCase,
              style: TextStyle(color:
               Colors.black,
               fontSize: 18,fontWeight: 
               FontWeight.bold),
               ),
          );
  }


  Widget _buildSuggestions(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context,i) {
          if(i.isOdd) return Divider();
          final index= i ~/2;
          if(index >=_suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));

          }
          return _buildRow(_suggestions[index]);
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text('Ezzu',),
      ),
    actions: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search,
            size: 26.0,
          ),
        )
      ),
      Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child: Icon(
              Icons.more_vert
          ),
        )
      ),
    ],
       ),
      drawer: _draw(),
      body:Padding(padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(height: 140,
            child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container
                width: 160.0,
                color: Colors.red,
                child: center(Text('iam ezzu',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 32,
                    ),
                ),
              ),
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          )
          ,
        ),
            Expanded(child: _buildSuggestions()),
          ],
        )
      )
    ); 
  }
}