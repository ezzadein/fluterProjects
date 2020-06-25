import 'package:flutter/material.dart';
class Score extends StatelessWidget {
  final scH;
  final scC;
  Score(this.scH,this.scC);
  @override
  Widget build(BuildContext context) {
    if (scH<3 && scC<3) 
    {
      return Container(
                child:Column(children: <Widget>
                  [
                    Text('score',textAlign: TextAlign.center,style:  TextStyle(color: Colors.white, fontSize: 20.0)),
                    Row(
                      children: <Widget>
                      [
                        Container(
                            alignment: Alignment.bottomLeft,
                            child: Text('humman:$scH',
                            style: TextStyle(color: Colors.white,
                            fontSize: 20.0) 

                            ),
                          ),
                Container(
                  padding: EdgeInsets.only(left:140),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'computer:$scC',                      textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white,
                    fontSize: 20.0
                  )
                )
              )
                  
            ],
          )
        ],
      ),
          
 
      
    );
 
      
    } else if(scC>=3) {
      return Container(
        child: Text('computer won!'),
      );      
    }else{
      return Container(
        child: Text('you won!'),
      );
    }
     }
}