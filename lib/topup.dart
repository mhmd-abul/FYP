import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swiftpay/bank.dart';

class TopUp extends StatefulWidget {
  TopUp({Key key}) : super(key: key);

  _TopUpState createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
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
            image: NetworkImage("https://kit8.net/images/thumbnails/580/386/detailed/3/Mobile_payment@2x.png"),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
          children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Top Up", style: TextStyle(fontSize: 24.0),),
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
                    child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,                           
                            children: <Widget>[
                              Text("Current Balance", style: TextStyle(color: Colors.grey[700], fontSize: 14.0,),),
                              Text("50", style: TextStyle(color: Colors.deepPurple[400], fontSize: 24.0,),),
                              Text("Ringgit Malaysia", style: TextStyle(color: Colors.grey[400], fontSize: 12.0,),),
                            ],
                          ),),
                        width: double.infinity,
                        height: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              left: BorderSide( //                   <--- left side
                                color: Colors.deepPurple[600],
                                width: 1.5,
                              ),
                              top: BorderSide( //                    <--- top side
                                color: Colors.deepPurple[600],
                                width: 1.5,
                              ),
                              right: BorderSide( //                    <--- right side
                                color: Colors.deepPurple[600],
                                width: 1.5,
                              ),
                              bottom: BorderSide( //                    <--- bottom side
                                color: Colors.deepPurple[600],
                                width: 1.5,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10.0)
                      ),
                   ),
                  //Current Balance
                  SizedBox(height: 60.0,),
                  Container(
                      height: 180.0,
                      child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: addbalance,
                      ),
                    ),
                  SizedBox(height: 12.0,),               
                  SizedBox(height: 20.0,),
                    GestureDetector(
                        onTap: (){
                            /*Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Register()
                            ));*/
                        },
                        child:  Row(   
                      ),
                    ),
                    SizedBox(height: 145.0,),
                    Container(
                      width: double.infinity,
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                          builder: (context) => BankPayment()
                          ));
                        },
                        child: Center(child: Text("Top Up", style: TextStyle(color: Colors.white, fontSize: 20.0),),),
                      ),
                    )
                ],
              )
          ],
        ),
      ),
    );
  }
}

List<Addbalance> addbalance = [
  Addbalance("https://www.siko.sk/-/media/Images/products/7/3/f/d/73FD087AC9144AF09C293C88FD4060D4.jpg?mw=800&mh=800", "5\nRinggit Malaysia"),
  Addbalance("https://i.pinimg.com/originals/c8/5d/58/c85d588b8b32e43dc7c75580cd16e3cc.jpg", "10\nRinggit Malaysia"),
  Addbalance("https://i.pinimg.com/originals/4e/ba/df/4ebadf9e598f25a1e440fb110e55e313.jpg", "20\nRinggit Malaysia"),
];

class Addbalance extends StatelessWidget {
  String img, addbalance;
  Addbalance(this.img, this.addbalance);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 115.5,
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.white,
           border: Border(
              left: BorderSide( //                   <--- left side
                color: Colors.grey[600],
                width: 1.5,
              ),
              top: BorderSide( //                    <--- top side
                color: Colors.grey[600],
                width: 1.5,
              ),
              right: BorderSide( //                    <--- right side
                color: Colors.grey[600],
                width: 1.5,
              ),
              bottom: BorderSide( //                    <--- bottom side
                color: Colors.grey[600],
                width: 1.5,
              ),
            ),
          borderRadius: BorderRadius.circular(22.0),
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,        
            children: <Widget>[
              Text(addbalance, style: TextStyle( fontFamily: "Regular", fontSize: 21.0, fontWeight: FontWeight.w600, color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}