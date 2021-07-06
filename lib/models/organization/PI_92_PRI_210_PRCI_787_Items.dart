import 'dart:convert';

import 'package:MMLMobile/models/RequestKeys.dart';

class PI_92_PRI_210_PRCI_787_Items {
  final int PK;
  final List<Film_Strip_Header> HEADER;
  final List<Film_Strip_Children> CHILDREN;

  PI_92_PRI_210_PRCI_787_Items({
    this.PK,
    this.HEADER,
    this.CHILDREN,
  });

  factory PI_92_PRI_210_PRCI_787_Items.fromJson(Map<String, dynamic> json) {
    return PI_92_PRI_210_PRCI_787_Items(
        PK: json['PK'],
        HEADER: json['HEADER'] != null
            ? (json['HEADER'] as List)
                .map((e) => Film_Strip_Header.fromJson(e))
                .toList()
            : null,
        CHILDREN: json['CHILDREN'] != null
            ? (json['CHILDREN'] as List)
                .map((e) => Film_Strip_Children.fromJson(e))
                .toList()
            : null);
  }

  Map<String, dynamic> toJson() {
    return {'PK': PK, 'HEADER': HEADER, 'CHILDREN': CHILDREN};
  }

// @override
// String toString() {
// return '{"TIR":$TIR,"IRE":$IRE,"LA": $LA,"NK":$NK,"IRD":$IRD,"DK":$DK}';
// }
}

class Film_Strip_Header {
  final int PK;
  final int CHILDREN_COUNT;
  final int INITIAL_INDEX1;

  Film_Strip_Header({this.PK, this.CHILDREN_COUNT, this.INITIAL_INDEX1});
  factory Film_Strip_Header.fromJson(Map<String, dynamic> json) {
    return Film_Strip_Header(
        PK: json['PK'],
        CHILDREN_COUNT: json['CHILDREN_COUNT'],
        INITIAL_INDEX1: json['INITIAL_INDEX1']);
  }

  Map<String, dynamic> toJson() {
    return {
      'PK': PK,
      'CHILDREN_COUNT': CHILDREN_COUNT,
      'INITIAL_INDEX1': INITIAL_INDEX1
    };
  }
}

class Film_Strip_Children {
  final int PK;
  final String UP_FILE;
  final String FILE_SIZE;
  final String NOTES;
  final String UP_USER;
  final String UP_DATE;
  String URL_STRIP_VIEW;
  String URL_DOWNLOAD;
  final int EDIT_PGP;
  final int INDEX1;
  final List<RequestKeys> RK;
  Film_Strip_Children(
      {this.PK,
      this.UP_FILE,
      this.FILE_SIZE,
      this.NOTES,
      this.UP_USER,
      this.UP_DATE,
      this.URL_STRIP_VIEW,
        this.URL_DOWNLOAD,
      this.INDEX1,
      this.EDIT_PGP,
      this.RK});
  factory Film_Strip_Children.fromJson(Map<String, dynamic> json) {
    return Film_Strip_Children(
        PK: json['PK'],
        EDIT_PGP: json['EDIT_PGP'],
        UP_FILE: json['UP_FILE'],
        FILE_SIZE: json['FILE_SIZE'],
        NOTES: json['NOTES'],
        UP_USER: json['UP_USER'],
        UP_DATE: json['UP_DATE'],
        URL_STRIP_VIEW: json['URL_STRIP_VIEW'],
        URL_DOWNLOAD: json['URL_DOWNLOAD'],
        INDEX1: json['INDEX1'],
        RK: json['RK'] != null
            ? (json['RK'] as List).map((e) => RequestKeys.fromJson(e)).toList()
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'PK': PK,
      'EDIT_PGP': EDIT_PGP,
      'UP_FILE': UP_FILE,
      'FILE_SIZE': FILE_SIZE,
      'NOTES': NOTES,
      'UP_USER': UP_USER,
      'UP_DATE': UP_DATE,
      'URL_STRIP_VIEW': URL_STRIP_VIEW,
      'URL_DOWNLOAD': URL_DOWNLOAD,
      'INDEX1': INDEX1,
      'RK': RK
    };
  }
}
