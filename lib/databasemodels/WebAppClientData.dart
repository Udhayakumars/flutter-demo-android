import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class WebAppClientData {

  @PrimaryKey(autoGenerate: true)
  final int id;

  final int PI;
  final int PRI;
  final int RI;
  final int PRCI;
  final int CI;
  final bool SV;
  final int DC;
  final DateTime D1;


  final bool CNV;
  final bool CNR;
  final bool ND;
  final bool ARR;



  final int BH;
  final int LF;

  final int RK_PI;
  final int RK_PTI;
  final int RKP;
  final String TRK;
  final int GT;
  final int UPX;
  final String RSS;
  final int RDI;
  final int RFE;
  final int RFM;
  final bool RLL;
  final int TEMI;

  final int X1;
  final int EI;
  final int ETI;
  final String ED;
  final bool EM1;
  final bool EM2;

  WebAppClientData({this.id, this.PI, this.PRI, this.RI, this.PRCI, this.CI,
    this.SV, this.DC, this.D1, this.CNV, this.CNR, this.RSS, this.RLL, this.UPX, this.X1, this.ND, this.ARR, this.BH, this.LF, this.RK_PI, this.RK_PTI, this.RKP, this.TRK, this.GT, this.RDI, this.RFE, this.RFM, this.TEMI, this.EI, this.ETI, this.ED, this.EM1, this.EM2, });

 // this.ND, this.ARR, this.BH, this.LF, this.RK_PI, this.RK_PTI,
  // this.RKP, this.TRK, this.GT, this.RDI, this.RFE, this.RFM,
  // this.TEMI, this.EI, this.ETI, this.ED, this.EM1, this.EM2,

  factory WebAppClientData.fromJson(Map<String, dynamic> json) {

    print(json['CNV']);
   // print(jsonDecode(json['DT']));

    //var mapValue = new Map<dynamic, dynamic>.from(json['DT']);
    //print(mapValue);



    return WebAppClientData(
        PI: json['PI'],
        PRI: json['PRI'],
        PRCI: json['PRCI'],
        CI: json['CI'],
        SV: json['SV'],
        DC: json['DC'],
        D1: json['D1'],
        CNV: json['CNV'],
        CNR: json['CNR'],
        RSS: json['RSS'],
        RLL: json['RLL'],
        UPX: json['UPX'],
        X1: json['X1'],
        ND: json['ND'],
      ARR: json['ARR'],
      BH: json['BH'],
      LF: json['LF'],
      RK_PI: json['RK_PI'],
      RK_PTI: json['RK_PTI'],
      RKP: json['RKP'],
      TRK: json['TRK'],
      GT: json['GT'],
      RDI: json['RDI'],
      RFE: json['RFE'],
      RFM: json['RFM'],
      TEMI: json['TEMI'],
      EI: json['EI'],
      ETI: json['ETI'],
      ED: json['ED'],
      EM1: json['EM1'],
      EM2: json['EM2'],


      //mapValue['Text'] as String != null ? mapValue['Text'] : (mapValue as List).map((e) => PageDirectionObject.fromJson(e)).toList(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PI': PI,
      'PRI': PRI,
      'PRCI': PRCI,
      'CI': CI,
      'SV': SV,
      'DC': DC,
      'D1': D1,
      'CNV': CNV,
      'CNR': CNR,
      'RSS': RSS,
      'RLL': RLL,
      'UPX':UPX,
      'X1': X1,
      'ND': ND,
      'ARR': ARR,
      'BH': BH,
      'LF': LF,
      'RK_PI': RK_PI,
      'RK_PTI': RK_PTI,
      'RKP': RKP,
      'TRK': TRK,
      'GT': GT,
      'RDI': RDI,
      'RFE': RFE,
      'RFM': RFM,
      'TEMI': TEMI,
      'EI': EI,
      'ETI': ETI,
      'ED': ED,
      'EM1': EM1,
      'EM2': EM2,


    };
  }


  // @override
  // String toString() {
  //   return "{'TY': $TY, 'PC': $PC, 'CL': $CL, 'TI': $TI, 'UI': $UI }";
  // }
}
