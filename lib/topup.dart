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
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://kit8.net/images/thumbnails/580/386/detailed/3/Mobile_payment@2x.png"),
                fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Top Up",
                  style: TextStyle(fontSize: 24.0),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Container(
                  height: 5.0,
                  width: 75.0,
                  decoration: BoxDecoration(color: Colors.blue),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Current Balance",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          "50",
                          style: TextStyle(
                            color: Colors.deepPurple[400],
                            fontSize: 32.0,
                          ),
                        ),
                        Text(
                          "Ringgit Malaysia",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  width: double.infinity,
                  height: 120.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          //                   <--- left side
                          color: Colors.deepPurple[600],
                          width: 1.5,
                        ),
                        top: BorderSide(
                          //                    <--- top side
                          color: Colors.deepPurple[600],
                          width: 1.5,
                        ),
                        right: BorderSide(
                          //                    <--- right side
                          color: Colors.deepPurple[600],
                          width: 1.5,
                        ),
                        bottom: BorderSide(
                          //                    <--- bottom side
                          color: Colors.deepPurple[600],
                          width: 1.5,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                //Current Balance
                SizedBox(
                  height: 80.0,
                ),
                Text(
                  "Enter Your Top Up Ammount",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1.0, -1.0),
                            color: Colors.black),
                        Shadow(
                            // bottomRight
                            offset: Offset(1.0, -1.0),
                            color: Colors.black),
                        Shadow(
                            // topRight
                            offset: Offset(1.0, 1.0),
                            color: Colors.black),
                        Shadow(
                            // topLeft
                            offset: Offset(-1.0, 1.0),
                            color: Colors.black),
                      ]),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      //Bg Colors for Container
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey[200])),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey[200])),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.blue)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey[200])),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.5),
                          child: Text(
                            "RM.",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15.5,
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: "MYR"),
                  ),
                ),
                SizedBox(
                  height: 165.0,
                ),
                Container(
                  width: double.infinity,
                  height: 55.0,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BankPayment()));
                    },
                    child: Center(
                      child: Text(
                        "Top Up",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
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
