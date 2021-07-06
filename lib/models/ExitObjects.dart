class ExitObject {
  final int P;
  final int C;
  final int I;
  final bool U;


  ExitObject({this.P, this.C, this.I, this.U, });

  factory ExitObject.fromJson(Map<String, dynamic> json) {
    return ExitObject(
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


  @override
  String toString() {
    return "{'P': $P, 'C': $C, 'I': $I, 'U': $U}";
  }
}
