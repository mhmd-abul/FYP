import 'package:flutter/material.dart';
import 'package:swiftpay/menu.dart';
import 'package:swiftpay/model/student.dart';
import 'package:swiftpay/auth.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Student> TopUp(String url, {Map body}) async {
  return http.post(url, body: json.encode(body), headers: {
    "Content-Type": "application/json"
  }).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Student.fromJson(json.decode(response.body));
  });
}

class BankPayment extends StatefulWidget {
  final int nominal;

  BankPayment(this.nominal);

  _BankPaymentState createState() => _BankPaymentState();
}

class _BankPaymentState extends State<BankPayment> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _user_bank = TextEditingController();
  final _user_password = TextEditingController();
  bool _validate_user_bank = false;
  bool _validate_user_password = false;

  void TopUpConfirmation() async {
    Student stud = await TopUp('http://3.0.160.40/student_topup', body: {
      'tpnumber': student_session['tpnumber'],
      "transaction_type": "Top Up",
      "nominal": widget.nominal
    });
    print(stud.tpnumber);
    print(stud.balance);
    student_session['balance'] = stud.balance;
    print(widget.nominal);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
  }

  @override
  void dispose() {
    _user_bank.dispose();
    _user_password.dispose();
    _validate_user_bank = false;
    _validate_user_password = false;
    super.dispose();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Confirm Payment"),
          content: new Text(
              "This action cannot be reverted based on terms and conditions applied"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () {
                TopUpConfirmation();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                  "CIMB Bank",
                  style: TextStyle(fontSize: 24.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 5.0,
                  width: 75.0,
                  decoration: BoxDecoration(color: Colors.red),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Image.network(
                    "https://assets.bharian.com.my/images/articles/logo_cimb_cropped.transformed.jpg"),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.red[200])),
                  child: TextField(
                    controller: _user_bank,
                    decoration: InputDecoration(
                      fillColor: Colors.red[200],
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.red[200])),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.red)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.red[200])),
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.red,
                      ),
                      contentPadding: EdgeInsets.all(8.0),
                      hintText: "User ID",
                      errorText: _validate_user_bank
                          ? 'Password Can\'t Be Empty'
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.red[200])),
                  child: TextField(
                    controller: _user_password,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.red[200],
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.red[200])),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.red)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.red[200])),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.red,
                      ),
                      contentPadding: EdgeInsets.all(8.0),
                      hintText: "Password",
                      errorText: _validate_user_password
                          ? 'Password Can\'t Be Empty'
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 160.0,
                ),
                Container(
                  width: double.infinity,
                  height: 55.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _user_bank.text.isEmpty
                            ? _validate_user_bank = true
                            : _validate_user_bank = false;

                        _user_password.text.isEmpty
                            ? _validate_user_password = true
                            : _validate_user_password = false;
                      });
                      if (_validate_user_bank == false &&
                          _validate_user_password == false) {
                        _showDialog();
                      } else if (_validate_user_bank == true &&
                          _validate_user_password == true) {
                        final snackbar = SnackBar(
                          content: Text(
                              'Please Check Your User ID and Your Password'),
                        );
                        scaffoldKey.currentState.showSnackBar(snackbar);
                      } else if (_validate_user_bank == true) {
                        final snackbar = SnackBar(
                          content: Text('Please Check Your User ID'),
                        );
                        scaffoldKey.currentState.showSnackBar(snackbar);
                      } else if (_validate_user_password == true) {
                        final snackbar = SnackBar(
                          content: Text('Please Check Your Password'),
                        );
                        scaffoldKey.currentState.showSnackBar(snackbar);
                      }
                    },
                    child: Center(
                      child: Text(
                        "Confirm",
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
