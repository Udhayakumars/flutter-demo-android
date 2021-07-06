class PI_95_PRI_213_PRCI_805_Items {
  int PK;
  String URLD4;
  String URLD5;

  PI_95_PRI_213_PRCI_805_Items({this.PK, this.URLD4, this.URLD5});

  PI_95_PRI_213_PRCI_805_Items.fromJson(Map<String, dynamic> json) {
    PK = json['PK'];
    URLD4 = json['URL_D4'];
    URLD5 = json['URL_D5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PK'] = this.PK;
    data['URL_D4'] = this.URLD4;
    data['URL_D5'] = this.URLD5;
    return data;
  }
}
