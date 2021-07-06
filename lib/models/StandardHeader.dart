class StandardHeader {
  final String VER;
  final dynamic ER_ID;
  final String ER;
  final int RS_ID;
  final String RS;
  final String M1;
  final String M2;
  final bool OK2X;
  final bool SD;
  final String BG;


  //"VER":"1.2.3.4","WAM_VER":"1.1.1.1","MAM_VER":"2.2.2.2","ER_ID":"0","ER":""
  //{\"VER\": \"1.0.4.0\",\"ER_ID\": 0,\"ER\": \"\",\"RS_ID\": 0,\"RS\": \"\",\"M1\": \"\",\"M2\": \"\",\"OK2X\": false,\"SD\": false,\"BG\": \"\"}}",
  StandardHeader({this.VER, this.ER_ID, this.ER, this.RS_ID, this.RS, this.M1, this.M2, this.OK2X, this.SD, this.BG});

  factory StandardHeader.fromJson(Map<String, dynamic> json) {
    return StandardHeader(
      VER: json['VER'],
      ER_ID: json['ER_ID'],
      ER: json['ER'],
      RS_ID: json['RS_ID'],
      RS: json['RS'],
      M1: json['M1'],
      M2: json['M2'],
      OK2X: json['OK2X'],
      SD: json['SD'],
      BG: json['BG'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'VER': VER,
      'ER_ID': ER_ID,
      'ER': ER,
      'RS_ID': RS_ID,
      'RS': RS,
      'M1': M1,
      'M2': M2,
      'OK2X': OK2X,
      'SD': SD,
      'BG': BG,
    };
  }


  // @override
  // String toString() {
  //   return "{'TY': $TY, 'PC': $PC, 'CL': $CL, 'TI': $TI, 'UI': $UI }";
  // }
}
