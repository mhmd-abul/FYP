import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swiftpay/auth.dart';
import 'package:intl/intl.dart';

Future<List> getTransactions(String url, {Map body}) async {
  print(url);
  return http.get(url).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    print('test message');
    print(response.body);
    List result = json.decode(response.body);

    return result;
  });
}

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List transactions;
  final format = new DateFormat('yyyy-MM-dd hh:mm');

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => yourFunction(context));
  }

  void yourFunction(BuildContext context) async {
    List response = await getTransactions(
        'http://10.0.2.2:4000/student_transaction/${student_session["tpnumber"]}');

    setState(() {
      transactions = response;
    });

    print(transactions);
  }

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
                    height: 508.5,
                    width: 600.0,
                    child: new ListView(
                      children: transactions != null
                          ? transactions
                              .map((transaction) => Card(
                                    elevation: 8.0,
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      child: Row(
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text('Date'),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text('Transaction Type'),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text('Amount'),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 95.0,
                                            width: 2.0,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200]),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(format
                                                    .format(DateTime.parse(
                                                            transaction['date'])
                                                        .toLocal())
                                                    .toString()),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(transaction[
                                                    'transaction_type']),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text('RM. ' +
                                                    transaction['nominal']
                                                        .toString()),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList()
                          : [],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
