import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class RowSources_RS_12_2 {

  // @PrimaryKey(autoGenerate: true)
  // final int id;
  // String KeyValue;
  // final int I;
  // final String D;
  // final String IA;

  @PrimaryKey(autoGenerate: true)
  final int id;
  final int I;
  final String D;
  final String S1;
  final bool B1;
  final bool B2;
  final bool B3;



  // intTableID As I
  // strRowSource As D
  // jsonRequestKey RK
  // strStorageItemsUrlsPrefix As S1
  // blnIsImageAsset As B1
  // blnIsBlobUrl As B2
  // blnRequiresSasToken As B3



  RowSources_RS_12_2( {this.S1, this.B1, this.B2, this.B3, this.id, this.I, this.D });

  factory RowSources_RS_12_2.fromJson(Map<String, dynamic> json) {
    return RowSources_RS_12_2(
      id: json['id'],
      S1: json['S1'],
      I: json['I'],
      D: json['D'],
      B1: json['B1'],
      B2: json['B2'],
      B3: json['B3']

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'S1': S1,
      'id': id,
      'I': I,
      'D': D,
      'B1': B1,
      'B2': B2,
      'B3': B3,
    };
  }


// @override
// String toString() {
//   return "{'TY': $TY, 'PC': $PC, 'CL': $CL, 'TI': $TI, 'UI': $UI }";
// }
}
