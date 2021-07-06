class PI_90_PRI_208_PRCI_819_Items {
  List<TvpLocationsAPPDATA> tvpLocationsAPPDATA;

  PI_90_PRI_208_PRCI_819_Items({this.tvpLocationsAPPDATA});

  PI_90_PRI_208_PRCI_819_Items.fromJson(Map<String, dynamic> json) {
    if (json['tvpLocations_APP_DATA'] != null) {
      tvpLocationsAPPDATA = new List<TvpLocationsAPPDATA>();
      json['tvpLocations_APP_DATA'].forEach((v) {
        tvpLocationsAPPDATA.add(new TvpLocationsAPPDATA.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tvpLocationsAPPDATA != null) {
      data['tvpLocations_APP_DATA'] =
          this.tvpLocationsAPPDATA.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TvpLocationsAPPDATA {
  int autoTvpID;
  String strLocationName;

  TvpLocationsAPPDATA({this.autoTvpID, this.strLocationName});

  TvpLocationsAPPDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    strLocationName = json['strLocationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['strLocationName'] = this.strLocationName;
    return data;
  }
}
