import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class RowSources_RS_1_10_2 {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final int I;
  final String RK;
  final String IA;
  final String D;

  RowSources_RS_1_10_2({this.id, this.RK, this.I, this.IA, this.D});

  factory RowSources_RS_1_10_2.fromJson(Map<String, dynamic> json) {
    print("json['RK']");
    print(jsonEncode(json['RK']));
    return RowSources_RS_1_10_2(
      id: json['id'],
      RK: jsonEncode(json['RK']).toString(),
      I: json['I'],
      IA: json['IA'],
      D: json['D'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'RK': RK,
      'id': id,
      'I': I,
      'IA': IA,
      'D': D,
    };
  }

// @override
// String toString() {
//   return "{'TY': $TY, 'PC': $PC, 'CL': $CL, 'TI': $TI, 'UI': $UI }";
// }
}
