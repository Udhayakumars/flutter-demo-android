import 'package:MMLMobile/databasemodels/WebAppClientKeysToSql.dart';

class InputConvertExitObjects {
  final int P;
  final int C;
  final int I;
  final bool U;


  InputConvertExitObjects({this.P, this.C, this.I, this.U, });

  factory InputConvertExitObjects.fromJson(Map<String, dynamic> json) {
    return InputConvertExitObjects(
        P: json['PC'],
        C: json['CL'],
        I: json['TI'],
        U: json['UI'],
    );
  }


  factory InputConvertExitObjects.fromWebClientSQL(WebAppClientKeysToSql json) {

    return InputConvertExitObjects(
      P: json.PC,
      C: json.CL,
      I: json.TI,
      U: json.UI == 1 ? true : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'P': P,
      'C': C,
      'I': I,
      'U': U,
    };
  }


  @override
  String toString() {
    return "{'P': $P, 'C': $C, 'I': $I, 'U': $U}";
  }
}
