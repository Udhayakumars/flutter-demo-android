import 'dart:convert';

import 'package:MMLMobile/databasemodels/WebAppClientKeysCache.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysRequestKeys.dart';
import 'package:MMLMobile/models/RequestKeys.dart';
import 'package:MMLMobile/models/Rkeys.dart';



class PI_33_PRI_130_PRCI_688_Parent {
  final int TIR;
  final int PTIR;
  final String LA;
  final int LV;
  final bool LF;
  final int PGP;
  final List<RequestKeys> NK;
  final bool ROOT;
  final List<RequestKeys> DK;


  PI_33_PRI_130_PRCI_688_Parent(
      {
        this.TIR,
        this.PTIR,
        this.LA,
        this.LV,
        this.PGP,
        this.LF,
        this.NK,
        this.ROOT,
        this.DK
      });

  factory PI_33_PRI_130_PRCI_688_Parent.fromJson(Map<String, dynamic> json) {


    return PI_33_PRI_130_PRCI_688_Parent(
        TIR: json['TIR'],
        PTIR: json['PTIR'],
        LA: json['LA'],
        LV: json['LV'],
        LF: json['LF'] != null ? json['LF'] : false,
        PGP: json['PGP'],
        NK: json['NK'] != null
            ? (json['NK'] as List)
            .map((e) => RequestKeys.fromJson(e))
            .toList()
            : null,

        DK: json['DK'] != null
            ? (json['DK'] as List)
            .map((e) => RequestKeys.fromJson(e))
            .toList()
            : null,
        ROOT: json['ROOT'] != null ? json['ROOT'] : false);
  }

  Map<String, dynamic> toJson() {
    return {
      'TIR': TIR,
      'LA': LA,
      'NK': NK,
      'LF': LF,
      'PGP': PGP,
      'ROOT': ROOT,
      'DK':DK
    };
  }

  @override
  String toString() {
    return '{"TIR":$TIR,"PTIR":$PTIR,"LA": $LA,"NK":$NK,"LF":$LF,"PGP":$PGP,"ROOT":$ROOT,"DK":$DK}';
  }
}
