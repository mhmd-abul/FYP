import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 24.0
        ),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage( 
            image: NetworkImage("https://cdn.dribbble.com/users/3618930/screenshots/6589966/g1.28_2x.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
        children: <Widget>[
          Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Transaction History", style: TextStyle(fontSize: 24.0),),
                  SizedBox(height: 6.0,),
                  Container(
                    height: 5.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                      color: Colors.blue
                    ),
                  ),
                    SizedBox(height: 12.0,),
                    Container(
                      height: 60.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                        //Bg Colors for Container
                        color: Colors.white,                      
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.blue[200])
                      ),
                      child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,                         
                            children: <Widget>[
                              Text("Date                       :", style: TextStyle(color: Colors.black, fontSize: 14.0,),),
                              SizedBox(height: 2.0,),
                              Text("Transaction Type :", style: TextStyle(color: Colors.black, fontSize: 14.0,),),
                              SizedBox(height: 2.0,),
                              Text("Nominal                :", style: TextStyle(color: Colors.black, fontSize: 14.0,),),
                            ],
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
} 