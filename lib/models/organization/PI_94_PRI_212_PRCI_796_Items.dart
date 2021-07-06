import 'dart:convert';

import 'PI_92_PRI_210_PRCI_787_Items.dart';

class PI_94_PRI_212_PRCI_796_Items {
  final int PK;
  final List<Film_Strip_Header> HEADER;
  List<Film_Strip_Children> CHILDREN;

  PI_94_PRI_212_PRCI_796_Items({
    this.PK,
    this.HEADER,
    this.CHILDREN,
  });

  factory PI_94_PRI_212_PRCI_796_Items.fromJson(Map<String, dynamic> json) {
    return PI_94_PRI_212_PRCI_796_Items(
        PK: json['PK'],
        HEADER: json['HEADER'] != null
            ? (json['HEADER'] as List)
            .map((e) => Film_Strip_Header.fromJson(e)).toList()
            : [],
        CHILDREN: json['CHILDREN'] != null
            ? (json['CHILDREN'] as List)
            .map((e) => Film_Strip_Children.fromJson(e)).toList()
            : []);
  }

  Map<String, dynamic> toJson() {
    return {'PK': PK, 'HEADER': HEADER, 'CHILDREN': CHILDREN};
  }

// @override
// String toString() {
// return '{"TIR":$TIR,"IRE":$IRE,"LA": $LA,"NK":$NK,"IRD":$IRD,"DK":$DK}';
// }
}

