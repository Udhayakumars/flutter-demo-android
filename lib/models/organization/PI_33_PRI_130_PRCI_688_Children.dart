import 'dart:convert';

import 'package:MMLMobile/databasemodels/WebAppClientKeysCache.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysRequestKeys.dart';
import 'package:MMLMobile/models/RequestKeys.dart';
import 'package:MMLMobile/models/Rkeys.dart';



class PI_33_PRI_130_PRCI_688_Children {
  final int ROW;
  final int TIR;
  final String LA;
  final int LV;
  final int IRA;
  final dynamic IA;
  final dynamic IRD;
  final dynamic IRE;
  final int PK;
  final bool LF;
  final bool RR;
  final int PGP;
  final List<RequestKeys> NK;
  final List<RequestKeys> DK;


  PI_33_PRI_130_PRCI_688_Children(
      {this.ROW,
        this.TIR,
        this.LA,
        this.IRA,
        this.IRE,
        this.IA,
        this.IRD,
        this.LV,
        this.PGP,
        this.LF,
        this.RR,
        this.NK,
        this.PK,
        this.DK
      });

  factory PI_33_PRI_130_PRCI_688_Children.fromJson(Map<String, dynamic> json) {


    return PI_33_PRI_130_PRCI_688_Children(
        TIR: json['TIR'],
        LA: json['LA'],
        IRA: json['IRA'],
        IA: json['IA'],
        IRD: json['IRD'],
        IRE: json['IRE'],
        LV: json['LV'],
        PK: json['PK'],
        LF: json['LF'] != null ? json['LF'] : false,
        RR: json['RR'] != null ? json['RR'] : false,
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ROW': ROW,
      'TIR': TIR,
      'LA': LA,
      'IRA': IRA,
      'IA': IA,
      'IRD': IRD,
      'IRE': IRE,
      'PK': PK,
      'NK': NK,
      'LF': LF,
      'RR': RR,
      'PGP': PGP,
      'DK':DK
    };
  }

  @override
  String toString() {
    return '{"ROW": $ROW,"TIR":$TIR,"LA": $LA,"IRA": $IRA,"IA": $IA,"PK": $PK,"NK":$NK,"LF":$LF,"RR":$RR,"PGP":$PGP,"IRE":$IRE,"DK":$DK}';
  }
}
