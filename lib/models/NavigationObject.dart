import 'dart:convert';


class NavigationObject {
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
  final dynamic DT;
  final int UPX;
  final String RSS;
  final bool RLL;
  final int X1;

  NavigationObject(
      {this.PI,
      this.PRI,
      this.RI,
      this.PRCI,
      this.CI,
      this.SV,
      this.DC,
      this.D1,
      this.CNV,
      this.CNR,
      this.DT,
      this.RSS,
      this.RLL,
      this.UPX,
      this.X1});

  factory NavigationObject.fromJson(Map<String, dynamic> json) {
    print(json['CNV']);
    // print(jsonDecode(json['DT']));

    //var mapValue = new Map<dynamic, dynamic>.from(json['DT']);
    //print(mapValue);

    return NavigationObject(
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
      DT: json['DT'],
      UPX: json['UPX'],
      X1: json['X1'],

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
      'DT': DT,
      'RSS': RSS,
      'RLL': RLL,
      'UPX': UPX,
      'X1': X1,
    };
  }

  @override
  String toString() {
    return '{"PI": $PI, "PRI": $PRI, "PRCI": $PRCI, "CI": $CI, "SV": $SV,"DC":$DC,"D1":$D1,"CNV" :$CNV,"CNR":$CNR,"DT":${DT},"RSS":$RSS,"RLL":$RLL,"UPX":$UPX,"X1":$X1}';
  }
}
