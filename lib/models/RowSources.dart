import 'dart:convert';
import 'package:MMLMobile/databasemodels/RowSourceDropdown.dart';
import 'package:MMLMobile/databasemodels/RowSources_30_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_12_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_13_23_6_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_1_10_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_29_41_15_6.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_31_42_2_6.dart';

class RowSources {
  final List<RowSources_RS_1_10_2> RS_1_10_2;
  final List<RowSources_RS_12_2> RS_12_2;
  final List<RowSources_RS_29_41_15_6> RS_29_41_15_6;
  final List<RowSources_RS_30_2> RS_30_2;
  final List<RowSources_RS_31_42_2_6> RS_31_42_2_6;
  final List<RowsourceDropDown> RS_13_23_6_2;
  final List<RowsourceDropDown> RS_13_25_6_2;
  final List<RowsourceDropDown> RS_13_22_6_2;
  final List<RowsourceDropDown> RS_13_24_6_2;
  // final List<Row>

  RowSources(
      {this.RS_1_10_2,
      this.RS_12_2,
      this.RS_29_41_15_6,
      this.RS_30_2,
      this.RS_31_42_2_6,
      this.RS_13_23_6_2,
      this.RS_13_25_6_2,
      this.RS_13_22_6_2,
      this.RS_13_24_6_2});

  factory RowSources.fromJson(Map<dynamic, dynamic> json) {
    return RowSources(
      RS_1_10_2: json['RS_1_10_2'] != null
          ? (json['RS_1_10_2'] as List)
              .map((e) => RowSources_RS_1_10_2.fromJson(e))
              .toList()
          : null,
      RS_12_2: json['RS_12_2'] != null
          ? (json['RS_12_2'] as List)
              .map((e) => RowSources_RS_12_2.fromJson(e))
              .toList()
          : null,
      RS_29_41_15_6: json['RS_29_41_15_6'] != null
          ? (json['RS_29_41_15_6'] as List)
              .map((e) => RowSources_RS_29_41_15_6.fromJson(e))
              .toList()
          : null,
      RS_30_2: json['RS_30_2'] != null
          ? (new List<dynamic>.from(json['RS_30_2']))
              .map((e) => RowSources_RS_30_2.fromJson(e))
              .toList()
          : null,
      RS_31_42_2_6: json['RS_31_42_2_6'] != null
          ? (new List<dynamic>.from(json['RS_31_42_2_6']))
              .map((e) => RowSources_RS_31_42_2_6.fromJson(e))
              .toList()
          : null,
      RS_13_23_6_2: json['RS_13_23_6_2'] != null
          ? (new List<dynamic>.from(json['RS_13_23_6_2']))
              .map((e) => RowsourceDropDown.fromJson(e))
              .toList()
          : null,
      RS_13_25_6_2: json['RS_13_25_6_2'] != null
          ? (new List<dynamic>.from(json['RS_13_25_6_2']))
              .map((e) => RowsourceDropDown.fromJson(e))
              .toList()
          : null,
      RS_13_22_6_2: json['RS_13_22_6_2'] != null
          ? (new List<dynamic>.from(json['RS_13_22_6_2']))
              .map((e) => RowsourceDropDown.fromJson(e))
              .toList()
          : null,
      RS_13_24_6_2: json['RS_13_24_6_2'] != null
          ? (new List<dynamic>.from(json['RS_13_24_6_2']))
          .map((e) => RowsourceDropDown.fromJson(e))
          .toList()
          : null,
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'RS_1_10_2': RS_1_10_2,
      'RS_12_2': RS_12_2,
      'RS_29_41_15_6': RS_29_41_15_6,
      'RS_30_2': RS_30_2,
      'RS_13_23_6_2': RS_13_23_6_2,
      'RS_13_25_6_2': RS_13_25_6_2,
      'RS_13_22_6_2': RS_13_22_6_2,
      'RS_13_24_6_2': RS_13_24_6_2
    };
  }
}
