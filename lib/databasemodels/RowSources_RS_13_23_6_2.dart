import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class RowSources_RS_13_23_6_2 {
  @PrimaryKey(autoGenerate: true)
  int id;
  int i;
  String d;
  String iA;
  String rK;

  RowSources_RS_13_23_6_2({this.id, this.i, this.d, this.iA, this.rK});

  RowSources_RS_13_23_6_2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    i = json['I'];
    d = json['D'];
    iA = json['IA'];
    // if (json['RK'] != null) {
      rK = jsonEncode(json['RK']).toString();
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['I'] = this.i;
    data['D'] = this.d;
    data['id'] = this.id;
    data['IA'] = this.iA;
    data['RK'] = this.rK;
    return data;
  }
}
