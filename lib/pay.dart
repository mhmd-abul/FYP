import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart';
import 'package:simple_permissions/simple_permissions.dart';

class Pay extends StatefulWidget {
  Pay({Key key}) : super(key: key);

  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  String data = "Scan QR Code To Make Payment";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
