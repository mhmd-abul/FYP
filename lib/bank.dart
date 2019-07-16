import 'package:flutter/material.dart';
import 'package:swiftpay/menu.dart';

class BankPayment extends StatefulWidget {
  BankPayment({Key key}) : super(key: key);

  _BankPaymentState createState() => _BankPaymentState();
}

class _BankPaymentState extends State<BankPayment> {
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Menu()));
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
                        hintText: "User ID"),
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
                        hintText: "Password"),
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
                      _showDialog();
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
