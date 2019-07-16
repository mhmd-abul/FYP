import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                image: AssetImage("assets/images/education.jpg"),
                fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Registration",
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
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "SwiftPay",
                      style: TextStyle(
                          fontSize: 50.0,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                // bottomLeft
                                offset: Offset(-1.3, -1.3),
                                color: Colors.purple),
                            Shadow(
                                // bottomRight
                                offset: Offset(1.3, -1.3),
                                color: Colors.purple),
                            Shadow(
                                // topRight
                                offset: Offset(1.3, 1.3),
                                color: Colors.purple),
                            Shadow(
                                // topLeft
                                offset: Offset(-1.3, 1.3),
                                color: Colors.purple),
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                //Membuat Inputan Login nya
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      //Bg Colors Untuk Container
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey[200])),
                  child: TextField(
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
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.blue,
                        ),
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: "TP Number        e.g : TP043983"),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      //Bg Colors Untuk Container
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey[200])),
                  child: TextField(
                    obscureText: true,
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
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: "Password"),
                  ),
                ),
                SizedBox(
                  height: 190.0,
                ),
                Container(
                  width: double.infinity,
                  height: 55.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
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
