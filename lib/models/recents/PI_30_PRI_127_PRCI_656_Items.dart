

import 'dart:convert';

import 'package:MMLMobile/databasemodels/WebAppClientKeysCache.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysRequestKeys.dart';
import 'package:MMLMobile/models/RequestKeys.dart';
import 'package:MMLMobile/models/Rkeys.dart';

class PI_30_PRI_127_PRCI_656_Items {
  final String PTI;
  final String TI;
  final int PI;
  final int PRI;
  final dynamic RK;
  final String LA;
  final int LV;
  final int IRA;
  final DateTime D1;
  final String S1;



  PI_30_PRI_127_PRCI_656_Items(
      {
        this.PTI,
        this.TI,
        this.PI,
        this.PRI,
        this.RK,
        this.LA,
        this.IRA,
        this.D1,
        this.S1,
        this.LV
      });

  factory PI_30_PRI_127_PRCI_656_Items.fromJson(Map<String, dynamic> json) {
    return PI_30_PRI_127_PRCI_656_Items(
        PTI: json['PTI'],
        TI: json['TI'],
        PI: json['PI'],
        PRI: json['PRI'],
        RK: json['RK'],
        LA: json['LA'],
        IRA: json['IRA'],
        D1: json['D1'] != null ? DateTime.parse(json['D1']) : null,
        S1: json['S1'],
        LV: json['LV'],
       );
  }

  Map<String, dynamic> toJson() {
    return {
      'PTI': PTI,
      'TI': TI,
      'PI': PI,
      'PRI': PRI,
      'RK': RK,
      'LA': LA,
      'IRA': IRA,
      'D1': D1,
      'S1': S1,
    };
  }

  @override
  String toString() {
    return '{"PTI": $PTI,"TI": $TI,"PI": $PI,"PRI": $PRI,"RK": $RK,"LA": $LA,"IRA": $IRA,"D1": $D1,"S1": $S1}';
  }
}

