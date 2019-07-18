import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swiftpay/history.dart';
import 'package:swiftpay/menu.dart';
import 'package:swiftpay/signup.dart';
import 'package:swiftpay/topup.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _tpnumber = TextEditingController();
  final _password = TextEditingController();
  bool _validate_tpnumber = false;
  bool _validate_password = false;

  @override
  void dispose() {
    _tpnumber.dispose();
    _password.dispose();
    _validate_tpnumber = false;
    _validate_password = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      //backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Sign In",
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
                  height: 2.0,
                ),
                Image.network(
                    "https://assets.materialup.com/uploads/f620e4f0-3f33-4382-9bbd-ebe0514e32a4/preview.jpg"),
                //Image.asset("assets/images/education.jpg", width: 300.0, height: 300.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "SwiftPay",
                      style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Asia Pacific University E-Wallet",
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ],
                ),
                //Create Login input
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
                    controller: _tpnumber,
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
                      hintText: "TP Number",
                      errorText: _validate_tpnumber
                          ? 'TP Number Can\'t Be Empty'
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      //Bg Colors Untuk Container
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey[200])),
                  child: TextField(
                    controller: _password,
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
                      hintText: "Password",
                      errorText: _validate_password
                          ? 'Password Can\'t Be Empty'
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Not Having Account Yet? Tap Here!",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 55.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _tpnumber.text.isEmpty
                            ? _validate_tpnumber = true
                            : _validate_tpnumber = false;

                        _password.text.isEmpty
                            ? _validate_password = true
                            : _validate_password = false;
                      });
                      if (_validate_tpnumber == false &&
                          _validate_password == false) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Menu()));
                      } else if (_validate_tpnumber == true &&
                          _validate_password == true) {
                        final snackbar = SnackBar(
                          content: Text(
                              'Please Check Your TP Number and Your Password'),
                        );
                        scaffoldKey.currentState.showSnackBar(snackbar);
                      } else if (_validate_tpnumber == true) {
                        final snackbar = SnackBar(
                          content: Text('Please Check Your TP Number'),
                        );
                        scaffoldKey.currentState.showSnackBar(snackbar);
                      } else if (_validate_password == true &&
                          _validate_password == true) {
                        final snackbar = SnackBar(
                          content: Text('Please Check Your Password'),
                        );
                        scaffoldKey.currentState.showSnackBar(snackbar);
                      }
                    },
                    child: Center(
                      child: Text(
                        "Sign In",
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
