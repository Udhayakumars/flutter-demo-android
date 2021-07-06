import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class RowSources {

  @PrimaryKey(autoGenerate: true)
  final int id;
  String KeyValue;
  final int I;
  final String D;
  final String IA;
  //final Rkeys RK;


  RowSources({this.id, this.KeyValue, this.I, this.D, this.IA});

  factory RowSources.fromJson(Map<String, dynamic> json) {


    return RowSources(
      id:json['id'],
      KeyValue: json['KeyValue'],
      I: json['I'],
      D: json['D'],
      IA: json['IA'],
     // RK: json['RK'] != null ? Rkeys.fromJson(new List<dynamic>.from(json['RK']).elementAt(0)) : null,
      //mapValue['Text'] as String != null ? mapValue['Text'] : (mapValue as List).map((e) => PageDirectionObject.fromJson(e)).toList(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'KeyValue': KeyValue,
      'id': id,
      'I': I,
      'D': D,
      'IA': IA,
      //'RK': RK,
    };
  }


// @override
// String toString() {
//   return "{'TY': $TY, 'PC': $PC, 'CL': $CL, 'TI': $TI, 'UI': $UI }";
// }
}
