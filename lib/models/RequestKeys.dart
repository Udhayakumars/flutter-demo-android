import 'package:MMLMobile/databasemodels/WebAppClientKeysToSql.dart';

class RequestKeys {
  final int TY;
  final int PC;
  final int CL;
  final int TI;
  final bool UI;


  RequestKeys(
      {this.TY, this.PC, this.CL, this.TI, this.UI});

  factory RequestKeys.fromJson(Map<String, dynamic> json) {
    return RequestKeys(
      TY: 0,
      PC: json['P'],
      CL: json['C'],
      TI: json['I'],
      UI: json['U']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'TY': 0,
      'PC': PC,
      'CL': CL,
      'TI': TI,
      'UI': UI
    };
  }

  @override
  String toString() {
    return "{'TY': $TY,'PC': $PC, 'CL': $CL, 'TI': $TI, 'UI': $UI}";
  }
}
