class PI_97_PRI_215_PRCI_807_Items {
  List<TvpStorageItemsEditing> tvpStorageItemsEditing;

  PI_97_PRI_215_PRCI_807_Items({this.tvpStorageItemsEditing});

  PI_97_PRI_215_PRCI_807_Items.fromJson(Map<String, dynamic> json) {
    if (json['tvpStorageItems_Editing'] != null) {
      tvpStorageItemsEditing = new List<TvpStorageItemsEditing>();
      json['tvpStorageItems_Editing'].forEach((v) {
        tvpStorageItemsEditing.add(new TvpStorageItemsEditing.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tvpStorageItemsEditing != null) {
      data['tvpStorageItems_Editing'] =
          this.tvpStorageItemsEditing.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TvpStorageItemsEditing {
  int autoTvpID;
  int intStorageItemIdID;
  bool blnStorageItemUid;
  String strStorageItemsUrlDerivative9;
  String strStorageItemsUrlDerivative10;
  List<JsonStorageItemsTransformations> jsonStorageItemsTransformations;

  TvpStorageItemsEditing(
      {this.autoTvpID,
        this.intStorageItemIdID,
        this.blnStorageItemUid,
        this.strStorageItemsUrlDerivative9,
        this.strStorageItemsUrlDerivative10,
        this.jsonStorageItemsTransformations});

  TvpStorageItemsEditing.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    intStorageItemIdID = json['intStorageItem_idID'];
    blnStorageItemUid = json['blnStorageItem_Uid'];
    strStorageItemsUrlDerivative9 = json['strStorageItemsUrl_Derivative9'];
    strStorageItemsUrlDerivative10 = json['strStorageItemsUrl_Derivative10'];
    if (json['jsonStorageItemsTransformations'] != null) {
      jsonStorageItemsTransformations =
      new List<JsonStorageItemsTransformations>();
      json['jsonStorageItemsTransformations'].forEach((v) {
        jsonStorageItemsTransformations
            .add(new JsonStorageItemsTransformations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['intStorageItem_idID'] = this.intStorageItemIdID;
    data['blnStorageItem_Uid'] = this.blnStorageItemUid;
    data['strStorageItemsUrl_Derivative9'] = this.strStorageItemsUrlDerivative9;
    data['strStorageItemsUrl_Derivative10'] =
        this.strStorageItemsUrlDerivative10;
    if (this.jsonStorageItemsTransformations != null) {
      data['jsonStorageItemsTransformations'] =
          this.jsonStorageItemsTransformations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JsonStorageItemsTransformations {
  int autoTvpID;
  List<JsonStorageItemsTransformationsHeader>
  jsonStorageItemsTransformationsHeader;
  List<JsonStorageItemsTransformationsChildren>
  jsonStorageItemsTransformationsChildren;

  JsonStorageItemsTransformations(
      {this.autoTvpID,
        this.jsonStorageItemsTransformationsHeader,
        this.jsonStorageItemsTransformationsChildren});

  JsonStorageItemsTransformations.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    if (json['jsonStorageItemsTransformations_Header'] != null) {
      jsonStorageItemsTransformationsHeader =
      new List<JsonStorageItemsTransformationsHeader>();
      json['jsonStorageItemsTransformations_Header'].forEach((v) {
        jsonStorageItemsTransformationsHeader
            .add(new JsonStorageItemsTransformationsHeader.fromJson(v));
      });
    }
    if (json['jsonStorageItemsTransformations_Children'] != null) {
      jsonStorageItemsTransformationsChildren =
      new List<JsonStorageItemsTransformationsChildren>();
      json['jsonStorageItemsTransformations_Children'].forEach((v) {
        jsonStorageItemsTransformationsChildren
            .add(new JsonStorageItemsTransformationsChildren.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    if (this.jsonStorageItemsTransformationsHeader != null) {
      data['jsonStorageItemsTransformations_Header'] = this
          .jsonStorageItemsTransformationsHeader
          .map((v) => v.toJson())
          .toList();
    }
    if (this.jsonStorageItemsTransformationsChildren != null) {
      data['jsonStorageItemsTransformations_Children'] = this
          .jsonStorageItemsTransformationsChildren
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}

class JsonStorageItemsTransformationsHeader {
  int autoTvpID;
  int intStorageItemIdID;
  bool blnStorageItemUid;

  JsonStorageItemsTransformationsHeader(
      {this.autoTvpID, this.intStorageItemIdID, this.blnStorageItemUid});

  JsonStorageItemsTransformationsHeader.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    intStorageItemIdID = json['intStorageItem_idID'];
    blnStorageItemUid = json['blnStorageItem_Uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['intStorageItem_idID'] = this.intStorageItemIdID;
    data['blnStorageItem_Uid'] = this.blnStorageItemUid;
    return data;
  }
}

class JsonStorageItemsTransformationsChildren {
  int autoTvpID;
  int intStorageItemsTransformationsTypeID;
  double dblData1;

  JsonStorageItemsTransformationsChildren(
      {this.autoTvpID,
        this.intStorageItemsTransformationsTypeID,
        this.dblData1});

  JsonStorageItemsTransformationsChildren.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    intStorageItemsTransformationsTypeID =
    json['intStorageItemsTransformationsTypeID'];
    dblData1 = json['dblData1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['intStorageItemsTransformationsTypeID'] =
        this.intStorageItemsTransformationsTypeID;
    data['dblData1'] = this.dblData1;
    return data;
  }
}
