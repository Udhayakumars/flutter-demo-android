class Rkeys {

  final int P;
  final int C;
  final int I;
  final dynamic U;

  Rkeys({this.P, this.C, this.I, this.U});

  factory Rkeys.fromJson(Map<String, dynamic> json) {
    return Rkeys(
      P: json['P'],
      C: json['C'],
      I: json['I'],
      U: json['U'],
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

//P": 193,
// "C": 153,
// "I": 10,
// "U": true
}