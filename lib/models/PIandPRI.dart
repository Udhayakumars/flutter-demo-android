class PIandPRI {
  final int PI;
  final int PRI;

  PIandPRI({this.PI, this.PRI});

  factory PIandPRI.fromJson(Map<String, dynamic> json) {
    return PIandPRI(
      PI: json['PI'],
      PRI: json['PRI'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'PI': PI, 'PRI': PRI};
  }

  @override
  String toString() {
    return "{'PI': $PI, 'PRI': $PRI}";
  }
}
