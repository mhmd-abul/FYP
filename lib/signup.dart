import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swiftpay/login.dart';
import 'package:swiftpay/menu.dart';
import 'package:swiftpay/model/student.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> createStudent(String url, {Map body}) async {
  return http.post(url, body: json.encode(body), headers: {
    "Content-Type": "application/json"
  }).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    print('test message');
    print(response.body);
    Map result = json.decode(response.body);

    return result;
  });
}

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _tpnumber = TextEditingController();
  final _password = TextEditingController();
  bool _validate_tpnumber = false;
  bool _validate_password = false;
  String _tpnumber_error_msg = null;
  String _password_error_msg = null;

  void handleSubmit() async {
    print('something');

    Map response = await createStudent('http://3.0.160.40/student_registration',
        body: {'tpnumber': _tpnumber.text, 'password': _password.text});
    print(response['error']);
    if (response['error'] != null) {
      final snackbar = SnackBar(
        content: Text(response['error']),
      );
      scaffoldKey.currentState.showSnackBar(snackbar);
    } else {
      Student stud = Student.fromJson(response);
      final snackbar = SnackBar(
        content: Text('You Have Been Registered, Welcome to SwiftPay'),
      );
      scaffoldKey.currentState.showSnackBar(snackbar);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  void dispose() {
    _tpnumber.dispose();
    _password.dispose();
    _validate_tpnumber = false;
    _validate_password = false;
    _tpnumber_error_msg = null;
    _password_error_msg = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                      hintText: "TP Number        e.g : TP043983",
                      errorText: _tpnumber_error_msg,
                    ),
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
                    controller: _password,
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
                      errorText: _password_error_msg,
                    ),
                  ),
                ),
                SizedBox(
                  height: 148.5,
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
                        if (_tpnumber.text.isEmpty) {
                          _validate_tpnumber = true;
                          _tpnumber_error_msg = 'tpnumber cannot be empty';
                        } else if (_tpnumber.text.length != 8) {
                          _validate_tpnumber = true;
                          _tpnumber_error_msg =
                              'tpnumber should be 8 characters';
                        } else if (!(new RegExp(r'^(TP)[0-9]')
                            .hasMatch(_tpnumber.text))) {
                          _validate_tpnumber = true;
                          _tpnumber_error_msg = 'must be a valid tpnumber';
                        } else {
                          _validate_tpnumber = false;
                        }
                        if (_password.text.isEmpty) {
                          _validate_password = true;
                          _password_error_msg = 'password cannot be empty';
                        } else if (_password.text.length < 6) {
                          _validate_password = true;
                          _password_error_msg =
                              'password should be more than 6 characters';
                        } else {
                          _validate_password = false;
                        }
                      });
                      if (_validate_tpnumber == false &&
                          _validate_password == false) {
                        handleSubmit();
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
