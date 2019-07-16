import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
                    "https://cdn.dribbble.com/users/3618930/screenshots/6589966/g1.28_2x.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Transaction History",
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
                SizedBox(
                    height: 550.0,
                    width: 600.0,
                    child: new ListView(
                      children: <Widget>[
                        Card(
                          elevation: 8.0,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Date'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Transaction Type'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Amount'),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 95.0,
                                  width: 2.0,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[200]),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('12-2-2019'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Top Up'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('RM. ' + '5'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 8.0,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Date'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Transaction Type'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Amount'),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 95.0,
                                  width: 2.0,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[200]),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('12-2-2019'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Top Up'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('RM. ' + '5'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
