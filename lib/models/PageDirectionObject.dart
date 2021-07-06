import 'dart:convert';

import 'package:MMLMobile/databasemodels/WebAppClientKeysCache.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysRequestKeys.dart';
import 'package:MMLMobile/models/RequestKeys.dart';
import 'package:MMLMobile/models/Rkeys.dart';

class PageDirectionObject {
  final String text;
  final int TIR;
  final int PTIR;
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
  final dynamic IA;
  final dynamic IRD;
  final dynamic IRE;
  final String IB;
  final int PK;
  final bool LF;
  final bool RR;
  final int PGP;
  final List<RequestKeys> NK;
  final List<RequestKeys> CK;
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
  final bool ROOT;
  final List<RequestKeys> DK;

  // {
  // "PTI": "1146A1B127",
  // "TI": "581A0B288",
  // "PI": 58,
  // "PRI": 175,
  // "RK": {
  // "P": 193,
  // "C": 153,
  // "I": 10,
  // "U": true
  // },
  // "LA": "Schedule #154",
  // "IRA": 415,
  // "D1": "2020-12-16T14:10:21.627",
  // "S1": "Installation new Capper Line"
  // },

  PageDirectionObject(
      {this.text,
      this.TIR,
      this.PTIR,
      this.PTI,
      this.TI,
      this.PI,
      this.PRI,
      this.RK,
      this.LA,
      this.IRA,
      this.IRE,
      this.D1,
      this.S1,
      this.IA,
      this.IRD,
      this.IB,
      this.LV,
      this.PGP,
      this.LF,
      this.RR,
      this.NK,
      this.CK,
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
      this.ROOT,
        this.DK
      });

  factory PageDirectionObject.fromJson(Map<String, dynamic> json) {
    print(json['RK']);

    var mapValue;

    return PageDirectionObject(
        text: json['text'],
        TIR: json['TIR'],
        PTIR: json['PTIR'],
        PTI: json['PTI'],
        TI: json['TI'],
        PI: json['PI'],
        PRI: json['PRI'],
        RK: json['RK'],
        LA: json['LA'],
        IRA: json['IRA'],
        D1: json['D1'] != null ? DateTime.parse(json['D1']) : null,
        S1: json['S1'],
        IA: json['IA'],
        IRD: json['IRD'],
        IRE: json['IRE'],
        IB: json['IB'],
        LV: json['LV'],
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
        LF: json['LF'] != null ? json['LF'] : false,
        RR: json['RR'] != null ? json['RR'] : false,
        PGP: json['PGP'],
        NK: json['NK'] != null
            ? (json['NK'] as List)
                .map((e) => RequestKeys.fromJson(e))
                .toList()
            : null,
        CK: json['CK'] != null
            ? (json['CK'] as List)
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
      'text': text,
      'TIR': TIR,
      'PTI': PTI,
      'TI': TI,
      'PI': PI,
      'PRI': PRI,
      'RK': RK,
      'LA': LA,
      'IRA': IRA,
      'D1': D1,
      'S1': S1,
      'IA': IA,
      'IRD': IRD,
      'IRE': IRE,
      'IB': IB,
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
      'NK': NK,
      'CK': CK,
      'LF': LF,
      'RR': RR,
      'PGP': PGP,
      'ROOT': ROOT,
      'DK':DK
    };
  }

  @override
  String toString() {
    return '{"text": $text,"TIR":$TIR,"PTIR":$PTIR,"PTI": $PTI,"TI": $TI,"PI": $PI,"PRI": $PRI,"RK": $RK,"LA": $LA,"IRA": $IRA,"D1": $D1,"S1": $S1,"IA": $IA,"IB": $IB,"PK": $PK,"S1A": $S1A,S1B": $S1B,"S2A": $S2A,"S2B": $S2B,"S3A": $S3A,"S3B": $S3B, "S4A": $S4A,"S4B": $S4B,"S5A": $S5A,"S5B": $S5B,"NK":$NK,"CK":$CK,"LF":$LF,"RR":$RR,"PGP":$PGP,"IRE":$IRE,"ROOT":$ROOT,"DK":$DK}';
  }
}
