class Student {
  String tpnumber;
  int balance;

  Student({this.tpnumber, this.balance});

  int get get_balance {
    return balance;
  }

  void set set_balance(int balance) {
    this.balance = balance;
    //balance right = balance set_balance int balance, balance left = balance int balance in the class top
  }

  String get get_tpnumber {
    return tpnumber;
  }

  void set set_tpnumber(String tpnumber) {
    this.tpnumber = tpnumber;
    //balance right = balance set_balance int balance, balance left = balance int balance in the class top
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      tpnumber: json['tpnumber'],
      balance: json['balance'],
    );
  }

  /*Map toMap() {
    var map = new Map<String, dynamic>();
    map["tpnumber"] = tpnumber;
    map["password"] = password;

    return map;
  }*/
}
