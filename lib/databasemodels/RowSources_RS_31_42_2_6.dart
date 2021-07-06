import 'dart:convert';

import 'package:floor/floor.dart';

@entity

// ignore: camel_case_types
class RowSources_RS_31_42_2_6 {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final int intDataTypeID;
  final int intGroup1DataTypeID;

  RowSources_RS_31_42_2_6({
    this.id,
    this.intDataTypeID,
    this.intGroup1DataTypeID,
  });

  factory RowSources_RS_31_42_2_6.fromJson(Map<String, dynamic> json) {
    return RowSources_RS_31_42_2_6(
      id:json['id'],
        intDataTypeID: json['intDataTypeID'],
        intGroup1DataTypeID: json['intGroup1_DataTypeID']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'intDataTypeID': intDataTypeID,
      'intGroup1_DataTypeID': intGroup1DataTypeID
    };
  }
}
