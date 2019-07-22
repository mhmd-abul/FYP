import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/scheduler.dart';
import 'package:swiftpay/history.dart';
import 'package:swiftpay/login.dart';
import 'package:swiftpay/pay.dart';
import 'package:swiftpay/topup.dart';
import 'package:swiftpay/auth.dart';

void main() => runApp(Menu());

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
            image: NetworkImage("https://assets.materialup.com/uploads/1e5279a8-a63e-49e8-b39f-bae561cd2462/preview.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child: Stack(
          children: <Widget>[
            
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  
                  children: <Widget>[
                    Container(
                      width: 55.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.5),
                        color: Colors.grey[300],
                        image: DecorationImage(
                          image: NetworkImage("https://cdn.iconscout.com/icon/free/png-512/avatar-372-456324.png"),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    SizedBox(width: 6.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(student_session['tpnumber'], style: TextStyle(fontFamily: "Regular", fontSize: 24.0, fontWeight: FontWeight.w600,),),
                        Text("APU Student", style: TextStyle(fontFamily: "Regular", fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.grey[400]),)
                      ],
                    ),
                    Spacer(),
                     GestureDetector(
                  onTap: () {
                    student_session.remove('tpnumber');
                    student_session.remove('balance');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Sign Out",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                  ], 
                ),
                SizedBox(height: 24.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,                           
                            children: <Widget>[
                              Text("Current Balance", style: TextStyle(color: Colors.grey[700], fontSize: 32.0,),),
                              Text(student_session['balance'].toString(), style: TextStyle(color: Colors.deepPurple[400], fontSize: 60.0,),),
                              Text("Ringgit Malaysia", style: TextStyle(color: Colors.grey[400], fontSize: 24.0,),),
                            ],
                          ),),
                          
                        width: 300.0,
                        height: 170.0,
                        //box top
                        decoration: BoxDecoration( 
                          color: Colors.white,                     
                          border: Border(
                          left: BorderSide( //                   <--- left side
                            color: Colors.blue[600],
                            width: 1.5,
                          ),
                          top: BorderSide( //                    <--- top side
                            color: Colors.blue[600],
                            width: 1.5,
                          ),
                          right: BorderSide( //                    <--- right side
                            color: Colors.blue[600],
                            width: 1.5,
                          ),
                          bottom: BorderSide( //                    <--- bottom side
                            color: Colors.blue[600],
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 24.0,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Text("S E R V I C E S", style: TextStyle(fontFamily: "Regular", fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.w600,shadows: [
                        Shadow( // bottomLeft
                          offset: Offset(-1.1, -1.1),
                          color: Colors.purple[800]
                        ),
                        Shadow( // bottomRight
                          offset: Offset(1.1, -1.1),
                          color: Colors.purple[800]
                        ),
                        Shadow( // topRight
                          offset: Offset(1.1, 1.1),
                          color: Colors.purple[800]
                        ),
                        Shadow( // topLeft
                          offset: Offset(-1.1, 1.1),
                          color: Colors.purple[800]
                        ),
                      ]),
                    ),
                   ],
                 ),
                 SizedBox(height: 30.0,),
                 Container(
                  height: 180.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: iconic,
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

List<Iconic> iconic = [
  Iconic("https://cdn.dribbble.com/users/3618930/screenshots/6589966/g1.28_2x.jpg", "Transaction History", 0),
  Iconic("https://elements-cover-images-0.imgix.net/e4741fdb-0171-4ce8-99df-293f746be041?auto=compress%2Cformat&fit=max&w=1370&s=b7dcd67ddf3b8532f9dc919143d7c904", "Payment", 1),
  Iconic("https://img.etimg.com/thumb/height-480,width-640,msid-69750832,imgsize-28655/money-transfer.jpg", "Add Balance", 2),
];



class Iconic extends StatelessWidget {
  var page = [
    History(),
    Pay(),
    TopUp()
  ];
  String img, iconic;
  int class_id;
  Iconic(this.img, this.iconic, this.class_id);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => page[class_id]
            ));
          },
          child: Container(
          width: 120.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.grey[400],
             border: Border(
                left: BorderSide( //                   <--- left side
                  color: Colors.grey[400],
                  width: 1.5,
                ),
                top: BorderSide( //                    <--- top side
                  color: Colors.grey[400],
                  width: 1.5,
                ),
                right: BorderSide( //                    <--- right side
                  color: Colors.grey[400],
                  width: 1.5,
                ),
                bottom: BorderSide( //                    <--- bottom side
                  color: Colors.grey[400],
                  width: 1.5,
                ),
              ),
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(img),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(iconic, style: TextStyle( fontFamily: "Regular", fontSize: 17.0, fontWeight: FontWeight.w600, color: Colors.white,shadows: [
                  Shadow( // bottomLeft
                    offset: Offset(-1.0, -1.0),
                    color: Colors.blue[800]
                  ),
                  Shadow( // bottomRight
                    offset: Offset(1.0, -1.0),
                    color: Colors.blue[800]
                  ),
                  Shadow( // topRight
                    offset: Offset(1.0, 1.0),
                    color: Colors.blue[800]
                  ),
                  Shadow( // topLeft
                    offset: Offset(-1.0, 1.0),
                    color: Colors.blue[800]
                  ),
                ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}