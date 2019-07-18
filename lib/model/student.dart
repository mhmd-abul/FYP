class Student {
  final String tpnumber;
  final String password;

  Student({this.tpnumber, this.password});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      tpnumber: json['tpnumber'],
      password: json['password'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["tpnumber"] = tpnumber;
    map["password"] = password;

    return map;
  }
}
