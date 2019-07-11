import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart';
import 'package:simple_permissions/simple_permissions.dart';


class Pay extends StatefulWidget {
  Pay({Key key}) : super(key: key);

  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {

  String data = "QR Code data";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment"),),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(data, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            RaisedButton(
              child: Text("Scan QR Code"),
              onPressed: (){
                ScanQR();
              },
            )
          ],
        ),
      ),
    );
  }

  void ScanQR() async
  {
    bool result = await SimplePermissions.checkPermission(Permission.Camera);
    PermissionStatus status =  PermissionStatus.notDetermined;
    if(!result)
      status = await SimplePermissions.requestPermission(Permission.Camera);

    if (result || status == PermissionStatus.authorized)
    {
      String scanResult = await scan();
      setState(() {
       data = scanResult; 
      });
    }
  }
}