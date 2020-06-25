import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/score.dart';
import 'package:tic_tac_toe/sidebar.dart';
import 'custom_dialog.dart';
import 'game_button.dart';
import 'score.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> buttonsList;
  var player1;
  var player2;
  var activePlayer;
  var scoreHumman =0;
  var scoreComputer =0;
  @override
  void initState(){
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit(){
    player1 = List();
    player2 = List();
    activePlayer = 1;

    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),

    ];
    return gameButtons;
  }
  void playGame(GameButton gb){
    setState(() {
      if(activePlayer==1){
        gb.text="X";
        gb.bg=Colors.red;
        activePlayer=2;
        player1.add(gb.id);
      }else{
        gb.text="O";
        gb.bg=Colors.blue;
        activePlayer=1;
        player2.add(gb.id);
      }
      gb.enable = false;
      var winner=checkWinner();
       if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => new CustomDialog("Game Tied",
                  "Press the reset button to start again.", okStart));
        }else if(activePlayer==2) {
          autoPlay();
          }
      }
    });
  }
  void autoPlay() {
    var emptyCells = new List();
    var list = new List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r =  Random();
    var randIndex = r.nextInt(emptyCells.length-1);
    var cellID = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p)=> p.id == cellID);
    playGame(buttonsList[i]);

  }

  
  int checkWinner() {

    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    // row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    // row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    // col 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    // col 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    // col 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    //diagonal
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        scoreHumman=scoreHumman+1;
        showDialog(
            context: context,
            builder: (_) => new CustomDialog("Player 1 Won",
                "Press the reset button to start again.", okStart));
      } else {
        scoreComputer+=1;
        showDialog(
            context: context,
            builder: (_) => new CustomDialog("Player 2 Won",
                "Press the reset button to start again.", okStart));
      }
    }
    return winner;
  }
  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      scoreComputer=0;
      scoreHumman=0;
      buttonsList = doInit();
    });
  }
    void okStart() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
    });
  }

  Widget build(BuildContext context) {
    return  Scaffold(
   appBar: AppBar( 
   title:Center(child: Text("Tic Tac Toe"))
   ) ,
   drawer: Drawer(
     child:SideBar()
   ),
   body:DecoratedBox(
     decoration:  BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      image: AssetImage('assets/images/ezzu.jpg'),
                      fit: BoxFit.cover),
                ),
 
     child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 9.0),
                itemCount: buttonsList.length,
                itemBuilder: (context, i) => SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: new RaisedButton(
                        padding: const EdgeInsets.all(8.0),
                        onPressed: buttonsList[i].enable
                            ? () => playGame(buttonsList[i])
                            : null,
                        child:  Text(
                          buttonsList[i].text,
                          style:  TextStyle(
                              color: Colors.white, fontSize: 20.0),
                        ),
                        color: buttonsList[i].bg,
                        disabledColor: buttonsList[i].bg,
                      ),
                    ),
              ),
            ),
            Container(
              color: Colors.blueAccent,
              height: 90,
              padding: EdgeInsets.all(10.0),
              child:Score(scoreHumman,scoreComputer)
            ),
            RaisedButton(
              child:  Text(
                "Reset",
                style:  TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.red,
              padding: const EdgeInsets.all(20.0),
              onPressed: resetGame,
            )
          ],
        )
 ,)
        );
  }  
}