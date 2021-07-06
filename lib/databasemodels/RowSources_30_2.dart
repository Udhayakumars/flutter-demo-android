import 'dart:convert';

import 'package:floor/floor.dart';

@entity

// ignore: camel_case_types
class RowSources_RS_30_2 {
  @PrimaryKey(autoGenerate: true)
  final int intWebAppTreeviewSortID;
  final String strRowSource;
  final int intDataTypeID;
  final int intIndex1;
  final bool blnDefaultOn;
  final bool blnSelected;
  final bool blnMatching;

  RowSources_RS_30_2(
      {this.intWebAppTreeviewSortID,
      this.strRowSource,
      this.intDataTypeID,
      this.intIndex1,
      this.blnDefaultOn,
      this.blnSelected,
      this.blnMatching});

  factory RowSources_RS_30_2.fromJson(Map<String, dynamic> json) {
    return RowSources_RS_30_2(
        intWebAppTreeviewSortID: json['intWebAppTreeviewSortID'],
        strRowSource: json['strRowSource'],
        intDataTypeID: json['intDataTypeID'],
        intIndex1: json['intIndex1'],
        blnDefaultOn: json['blnDefaultOn'] != null
            ? (json['blnDefaultOn'] is int
                ? (json['blnDefaultOn'] == 1 ? true : false)
                : json['blnDefaultOn'])
            : false,
        blnSelected: json['blnSelected'] != null
            ? (json['blnSelected'] is int
                ? (json['blnSelected'] == 1 ? true : false)
                : json['blnSelected'])
            : false,
        blnMatching: json['blnMatching'] != null
            ? (json['blnMatching'] is int
                ? (json['blnMatching'] == 1 ? true : false)
                : json['blnMatching'])
            : false);
  }

  Map<String, dynamic> toJson() {
    return {
      'intWebAppTreeviewSortID': intWebAppTreeviewSortID,
      'strRowSource': strRowSource,
      'intDataTypeID': intDataTypeID,
      'intIndex1': intIndex1,
      'blnDefaultOn': blnDefaultOn,
      'blnSelected': blnSelected,
      'blnMatching': blnMatching
    };
  }
}
