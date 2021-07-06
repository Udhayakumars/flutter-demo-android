import 'dart:convert';

import 'package:MMLMobile/databasemodels/WebAppClientKeysCache.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysRequestKeys.dart';
import 'package:MMLMobile/models/RequestKeys.dart';
import 'package:MMLMobile/models/Rkeys.dart';

class PI_33_PRI_130_PRCI_688_TreePath {
  final int PK;
  final int TIR;
  final String LA;
  final int LV;
  final int IRD;
  final int IRE;
  final List<RequestKeys> NK;
  final List<RequestKeys> DK;

  PI_33_PRI_130_PRCI_688_TreePath(
      {this.TIR,
      this.PK,
      this.IRD,
      this.IRE,
      this.LA,
      this.LV,
      this.NK,
      this.DK});

  factory PI_33_PRI_130_PRCI_688_TreePath.fromJson(Map<String, dynamic> json) {
    return PI_33_PRI_130_PRCI_688_TreePath(
        TIR: json['TIR'],
        LA: json['LA'],
        LV: json['LV'],
        IRD: json['IRD'],
        IRE: json['IRE'],
        NK: json['NK'] != null
            ? (json['NK'] as List).map((e) => RequestKeys.fromJson(e)).toList()
            : null,
        DK: json['DK'] != null
            ? (json['DK'] as List).map((e) => RequestKeys.fromJson(e)).toList()
            : null);
  }

  Map<String, dynamic> toJson() {
    return {'TIR': TIR, 'LA': LA, 'NK': NK, 'IRE': IRE, "IRD": IRD, 'DK': DK};
  }

  @override
  String toString() {
    return '{"TIR":$TIR,"IRE":$IRE,"LA": $LA,"NK":$NK,"IRD":$IRD,"DK":$DK}';
  }
}
