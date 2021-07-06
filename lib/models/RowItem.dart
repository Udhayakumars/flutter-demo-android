import 'dart:convert';

import 'package:MMLMobile/models/Rkeys.dart';

class RowItem {
  final int I;
  final String D;
  final String IA;
  final Rkeys RK;
  final int I1;
  final int I2;
  final int I3;
  final int I4;
  final bool B1;

  RowItem({this.I, this.I1, this.I2,  this.I3, this.I4, this.D, this.IA, this.RK, this.B1});

  factory RowItem.fromJson(Map<String, dynamic> json) {


    // print(jsonDecode(json['DT']));

    //var mapValue = new Map<dynamic, dynamic>.from(json['DT']);
    print("rk$json['RK']");



    return RowItem(
      I: json['I'],
      I1: json['I1'],
      I2: json['I2'],
      I3: json['I3'],
      I4: json['I4'],
      D: json['D'],
      IA: json['IA'],
      RK: json['RK'] != null ? Rkeys.fromJson(new List<dynamic>.from(json['RK']).elementAt(0)) : null,
      B1: json['B1'],
      //mapValue['Text'] as String != null ? mapValue['Text'] : (mapValue as List).map((e) => PageDirectionObject.fromJson(e)).toList(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'I': I,
      'I1': I1,
      'I2': I2,
      'I3': I3,
      'I4': I4,
      'D': D,
      'IA': IA,
      'RK': RK,
      'B1': B1
    };
  }


  // @override
  // String toString() {
  //   return "{'TY': $TY, 'PC': $PC, 'CL': $CL, 'TI': $TI, 'UI': $UI }";
  // }
}
