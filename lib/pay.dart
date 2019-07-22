import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:swiftpay/model/student.dart';
import 'package:swiftpay/auth.dart';
import 'package:swiftpay/menu.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Student> Payment(String url, {Map body}) async {
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

class Pay extends StatefulWidget {
  Pay({Key key}) : super(key: key);

  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  String data = "Scan QR Code To Make Payment";

  void PaymentProcess() async {
    Student stud = await Payment('http://10.0.2.2:4000/student_payment', body: {
      'tpnumber': student_session['tpnumber'],
      "transaction_type": "Deduct",
      "nominal": int.parse(data)
    });
    print(stud.tpnumber);
    print(stud.balance);
    student_session['balance'] = stud.balance;
    print(data);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Menu()));
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Payment"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.network(
                  "https://cdn.dribbble.com/users/7344/screenshots/1484300/scan-qr-code-01.png"),
              Text(
                data,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              RaisedButton(
                color: Colors.blue[600],
                child: Text("Scan QR Code",
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: () {
                  ScanQR();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void ScanQR() async {
    bool result = await SimplePermissions.checkPermission(Permission.Camera);
    PermissionStatus status = PermissionStatus.notDetermined;
    if (!result)
      status = await SimplePermissions.requestPermission(Permission.Camera);

    if (result || status == PermissionStatus.authorized) {
      String scanResult = await scan();
      setState(() {
        data = scanResult;
      });
    }
  }
}
