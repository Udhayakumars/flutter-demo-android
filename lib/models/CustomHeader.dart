class CustomHeader {

  final int ML_AC_ID;
  final int CR_US_ID;
  final int SN_ID;


  CustomHeader({this.ML_AC_ID, this.CR_US_ID, this.SN_ID});

  factory CustomHeader.fromJson(Map<String, dynamic> json) {
    return CustomHeader(
        ML_AC_ID: json['ML_AC_ID'],
        CR_US_ID: json['CR_US_ID'],
        SN_ID: json['SN_ID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ML_AC_ID': ML_AC_ID,
      'CR_US_ID': CR_US_ID,
      'SN_ID': SN_ID,
    };
  }


  // @override
  // String toString() {
  //   return "{'TY': $TY, 'PC': $PC, 'CL': $CL, 'TI': $TI, 'UI': $UI }";
  // }
}
