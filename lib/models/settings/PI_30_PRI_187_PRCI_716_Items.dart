
import 'dart:convert';

import 'package:MMLMobile/databasemodels/WebAppClientKeysCache.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysRequestKeys.dart';
import 'package:MMLMobile/models/RequestKeys.dart';
import 'package:MMLMobile/models/Rkeys.dart';


class PI_30_PRI_187_PRCI_716_Items {



  final String LA;
  final int PK;
  final String S1A;
  final String S1B;
  final String S2A;
  final String S2B;
  final String S3A;
  final String S3B;
  final String S4A;
  final String S4B;
  final String S5A;
  final String S5B;


  PI_30_PRI_187_PRCI_716_Items(
      {
        this.LA,
        this.PK,
        this.S1A,
        this.S1B,
        this.S2A,
        this.S2B,
        this.S3A,
        this.S3B,
        this.S4A,
        this.S4B,
        this.S5A,
        this.S5B,
      });

  factory PI_30_PRI_187_PRCI_716_Items.fromJson(Map<String, dynamic> json) {
    return PI_30_PRI_187_PRCI_716_Items(
        LA: json['LA'],
        PK: json['PK'],
        S1A: json['S1A'],
        S1B: json['S1B'],
        S2A: json['S2A'],
        S2B: json['S2B'],
        S3A: json['S3A'],
        S3B: json['S3B'],
        S4A: json['S4A'],
        S4B: json['S4B'],
        S5A: json['S5A'],
        S5B: json['S5B'],
       );
  }

  Map<String, dynamic> toJson() {
    return {
      'LA': LA,
      'PK': PK,
      'S1A': S1A,
      'S1B': S1B,
      'S2A': S2A,
      'S2B': S2B,
      'S3A': S3A,
      'S3B': S3B,
      'S4A': S4A,
      'S4B': S4B,
      'S5A': S5A,
      'S5B': S5B,

    };
  }

  @override
  String toString() {
    return '{"LA": $LA,"PK": $PK,"S1A": $S1A,S1B": $S1B,"S2A": $S2A,"S2B": $S2B,"S3A": $S3A,"S3B": $S3B, "S4A": $S4A,"S4B": $S4B,"S5A": $S5A,"S5B": $S5B}';
  }
}

