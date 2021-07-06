class RowsourceDropDown {
  int i;
  int u;
  String d;
  String iA;
  List<RK> rK;

  RowsourceDropDown({this.i, this.u, this.d, this.iA, this.rK});

  RowsourceDropDown.fromJson(Map<String, dynamic> json) {
    i = json['I'];
    u = json['U'];
    d = json['D'];
    iA = json['IA'];
    if (json['RK'] != null) {
      rK = new List<RK>();
      json['RK'].forEach((v) {
        rK.add(new RK.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['I'] = this.i;
    data['U'] = this.u;
    data['D'] = this.d;
    data['IA'] = this.iA;
    if (this.rK != null) {
      data['RK'] = this.rK.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RK {
  int c;
  int i;
  bool u;

  RK({this.c, this.i, this.u});

  RK.fromJson(Map<String, dynamic> json) {
    c = json['C'];
    i = json['I'];
    u = json['U'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['C'] = this.c;
    data['I'] = this.i;
    data['U'] = this.u;
    return data;
  }
}
