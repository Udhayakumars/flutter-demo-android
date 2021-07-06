import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class RowSources_RS_29_41_15_6 {

  // @PrimaryKey(autoGenerate: true)
  // final int id;
  // String KeyValue;
  // final int I;
  // final String D;
  // final String IA;

  @PrimaryKey(autoGenerate: true)
  final int id;
  final int I;
  final String RK;
  final String D;
  final String S1;
  final int I1;
  final int I2;
  final int I3;
  final int I4;
  final bool B1;
  final bool B2;



  // intTableID As I
  // strRowSource As D
  // jsonRequestKey RK
  // strStorageItemsUrlsPrefix As S1
  // blnIsImageAsset As B1
  // blnIsBlobUrl As B2
  // blnRequiresSasToken As B3



  RowSources_RS_29_41_15_6( {this.RK, this.S1, this.I1, this.I2, this.I3, this.I4,  this.id, this.I, this.D, this.B1,this.B2 });

  factory RowSources_RS_29_41_15_6.fromJson(Map<String, dynamic> json) {


    return RowSources_RS_29_41_15_6(
      id: json['id'],
      S1: json['S1'],
      I: json['I'],
      D: json['D'],
      RK: json['RK'] != null ? json['RK'].toJson().toString() : json['RK'],
      I1: json['I1'],
      I2: json['I2'],
      I3: json['I3'],
      I4: json['I4'],
        B1: json['B1'],
     B2:json['B2']
     // RK: json[B1] != null ? Rkeys.fromJson(new List<dynamic>.from(json['RK']).elementAt(0)) : null,
      //mapValue['Text'] as String != null ? mapValue['Text'] : (mapValue as List).map((e) => PageDirectionObject.fromJson(e)).toList(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'S1': S1,
      'id': id,
      'I': I,
      'D': D,
      'RK': RK,
      'I1': I1,
      'I2': I2,
      'I3': I3,
      'I4': I4,
      'B1': B1,
      'B2':B2
      //'RK': RK,
    };
  }


// @override
// String toString() {
//   return "{'TY': $TY, 'PC': $PC, 'CL': $CL, 'TI': $TI, 'UI': $UI }";
// }
}
