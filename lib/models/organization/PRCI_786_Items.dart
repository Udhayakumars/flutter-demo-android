class PRCI_786_Items {
  List<TvpThingsDATA> tvpThingsDATA;

  PRCI_786_Items({this.tvpThingsDATA});

  PRCI_786_Items.fromJson(Map<String, dynamic> json) {
    if (json['tvpThings_DATA'] != null) {
      tvpThingsDATA = new List<TvpThingsDATA>();
      json['tvpThings_DATA'].forEach((v) {
        tvpThingsDATA.add(new TvpThingsDATA.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tvpThingsDATA != null) {
      data['tvpThings_DATA'] =
          this.tvpThingsDATA.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TvpThingsDATA {
  int autoTvpID;
  int idID;
  bool blnUid;
  String strSummaryID;
  String strActiveStatus;
  String strCreatedDate;
  String strCreatedBy;
  String strThingName;
  String strThingType;
  String strUserCode1;
  String strDescription;
  int intOrganizationNode1AutoID;
  String strInventoryPurchasingRequirements;
  String strInventoryOnHand;
  double dblInventoryMinimum;
  double dblInventoryMaximum;
  double dblInventoryBuyLotSize;
  List<JsonCoreTablesEditingSectionsDATA> jsonCoreTablesEditingSectionsDATA;
  List<JsonThingsSourcesDATA> jsonThingsSourcesDATA;
  List<JsonThingsInventorySummaryDATA> jsonThingsInventorySummaryDATA;
  List<JsonThingsInventoryLotsDATA> jsonThingsInventoryLotsDATA;
  List<JsonThingsInventoryLocationsDATA> jsonThingsInventoryLocationsDATA;

  TvpThingsDATA(
      {this.autoTvpID,
      this.idID,
      this.blnUid,
        this.strSummaryID,
      this.strActiveStatus,
      this.strCreatedDate,
      this.strCreatedBy,
      this.strThingName,
      this.strThingType,
      this.strUserCode1,
      this.strDescription,
      this.intOrganizationNode1AutoID,
      this.strInventoryPurchasingRequirements,
      this.strInventoryOnHand,
      this.dblInventoryMinimum,
      this.dblInventoryMaximum,
      this.dblInventoryBuyLotSize,
      this.jsonCoreTablesEditingSectionsDATA,
      this.jsonThingsSourcesDATA,
      this.jsonThingsInventorySummaryDATA,
      this.jsonThingsInventoryLotsDATA,
      this.jsonThingsInventoryLocationsDATA});

  TvpThingsDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    idID = json['idID'];
    strSummaryID = json['strSummary_ID'];
    intOrganizationNode1AutoID = json["intOrganizationNode1_autoID"];
    blnUid = json['blnUid'];
    strActiveStatus = json['strActiveStatus'];
    strCreatedDate = json['strCreatedDate'];
    strCreatedBy = json['strCreatedBy'];
    strThingName = json['strThingName'];
    strThingType = json['strThingType'];
    strUserCode1 = json['strUserCode1'];
    strDescription = json['strDescription'];
    strInventoryPurchasingRequirements =
        json['strInventoryPurchasingRequirements'];
    strInventoryOnHand = json['strInventoryOnHand'];
    dblInventoryMinimum = json['dblInventory_Minimum'];
    dblInventoryMaximum = json['dblInventory_Maximum'];
    dblInventoryBuyLotSize = json['dblInventory_BuyLotSize'];
    if (json['jsonCoreTablesEditingSections_DATA'] != null) {
      jsonCoreTablesEditingSectionsDATA =
          new List<JsonCoreTablesEditingSectionsDATA>();
      json['jsonCoreTablesEditingSections_DATA'].forEach((v) {
        jsonCoreTablesEditingSectionsDATA
            .add(new JsonCoreTablesEditingSectionsDATA.fromJson(v));
      });
    }

    jsonThingsSourcesDATA = new List<JsonThingsSourcesDATA>();
    if (json['jsonThingsSources_DATA'] != null) {
      json['jsonThingsSources_DATA'].forEach((v) {
        jsonThingsSourcesDATA.add(new JsonThingsSourcesDATA.fromJson(v));
      });
    }
    jsonThingsInventorySummaryDATA = new List<JsonThingsInventorySummaryDATA>();
    if (json['jsonThingsInventorySummary_DATA'] != null) {
      json['jsonThingsInventorySummary_DATA'].forEach((v) {
        jsonThingsInventorySummaryDATA
            .add(new JsonThingsInventorySummaryDATA.fromJson(v));
      });
    }
    jsonThingsInventoryLotsDATA = new List<JsonThingsInventoryLotsDATA>();
    if (json['jsonThingsInventoryLots_DATA'] != null) {
      json['jsonThingsInventoryLots_DATA'].forEach((v) {
        jsonThingsInventoryLotsDATA
            .add(new JsonThingsInventoryLotsDATA.fromJson(v));
      });
    }
    jsonThingsInventoryLocationsDATA =
        new List<JsonThingsInventoryLocationsDATA>();
    if (json['jsonThingsInventoryLocations_DATA'] != null) {
      json['jsonThingsInventoryLocations_DATA'].forEach((v) {
        jsonThingsInventoryLocationsDATA
            .add(new JsonThingsInventoryLocationsDATA.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['idID'] = this.idID;
    data['blnUid'] = this.blnUid;
    data['intOrganizationNode1AutoID'] = this.intOrganizationNode1AutoID;
    data['strActiveStatus'] = this.strActiveStatus;
    data['strCreatedDate'] = this.strCreatedDate;
    data['strCreatedBy'] = this.strCreatedBy;
    data['strThingName'] = this.strThingName;
    data['strThingType'] = this.strThingType;
    data['strUserCode1'] = this.strUserCode1;
    data['strDescription'] = this.strDescription;
    data['strInventoryPurchasingRequirements'] =
        this.strInventoryPurchasingRequirements;
    data['strInventoryOnHand'] = this.strInventoryOnHand;
    data['dblInventory_Minimum'] = this.dblInventoryMinimum;
    data['dblInventory_Maximum'] = this.dblInventoryMaximum;
    data['dblInventory_BuyLotSize'] = this.dblInventoryBuyLotSize;
    if (this.jsonCoreTablesEditingSectionsDATA != null) {
      data['jsonCoreTablesEditingSections_DATA'] = this
          .jsonCoreTablesEditingSectionsDATA
          .map((v) => v.toJson())
          .toList();
    }
    if (this.jsonThingsSourcesDATA != null) {
      data['jsonThingsSources_DATA'] =
          this.jsonThingsSourcesDATA.map((v) => v.toJson()).toList();
    }
    if (this.jsonThingsInventorySummaryDATA != null) {
      data['jsonThingsInventorySummary_DATA'] =
          this.jsonThingsInventorySummaryDATA.map((v) => v.toJson()).toList();
    }
    if (this.jsonThingsInventoryLotsDATA != null) {
      data['jsonThingsInventoryLots_DATA'] =
          this.jsonThingsInventoryLotsDATA.map((v) => v.toJson()).toList();
    }
    if (this.jsonThingsInventoryLocationsDATA != null) {
      data['jsonThingsInventoryLocations_DATA'] =
          this.jsonThingsInventoryLocationsDATA.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JsonCoreTablesEditingSectionsDATA {
  int autoTvpID;
  int intCoreTableSectionID;
  int intSystemSectionsStatusID;

  JsonCoreTablesEditingSectionsDATA(
      {this.autoTvpID,
      this.intCoreTableSectionID,
      this.intSystemSectionsStatusID});

  JsonCoreTablesEditingSectionsDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    intCoreTableSectionID = json['intCoreTableSectionID'];
    intSystemSectionsStatusID = json['intSystemSectionsStatusID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['intCoreTableSectionID'] = this.intCoreTableSectionID;
    data['intSystemSectionsStatusID'] = this.intSystemSectionsStatusID;
    return data;
  }
}

class JsonThingsSourcesDATA {
  int autoTvpID;
  int intThingsSourceIdID;
  bool blnThingsSourceUid;
  bool blnIsActive;
  String strManufacturer;
  String strModel;

  JsonThingsSourcesDATA(
      {this.autoTvpID,
      this.intThingsSourceIdID,
      this.blnThingsSourceUid,
      this.blnIsActive,
      this.strManufacturer,
      this.strModel});

  JsonThingsSourcesDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    intThingsSourceIdID = json['intThingsSource_idID'];
    blnThingsSourceUid = json['blnThingsSource_Uid'];
    blnIsActive = json['blnIsActive'];
    strManufacturer = json['strManufacturer'];
    strModel = json['strModel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['intThingsSource_idID'] = this.intThingsSourceIdID;
    data['blnThingsSource_Uid'] = this.blnThingsSourceUid;
    data['blnIsActive'] = this.blnIsActive;
    data['strManufacturer'] = this.strManufacturer;
    data['strModel'] = this.strModel;
    return data;
  }
}

class JsonThingsInventorySummaryDATA {
  int autoTvpID;
  String strInventoryTotal;
  String strTotalOnHandAndValue;
  String strPurchasingLevels;

  JsonThingsInventorySummaryDATA(
      {this.autoTvpID,
      this.strInventoryTotal,
      this.strTotalOnHandAndValue,
      this.strPurchasingLevels});

  JsonThingsInventorySummaryDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    strInventoryTotal = json['strInventoryTotal'];
    strTotalOnHandAndValue = json['strTotalOnHandAndValue'];
    strPurchasingLevels = json['strPurchasingLevels'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['strInventoryTotal'] = this.strInventoryTotal;
    data['strTotalOnHandAndValue'] = this.strTotalOnHandAndValue;
    data['strPurchasingLevels'] = this.strPurchasingLevels;
    return data;
  }
}

class JsonThingsInventoryLotsDATA {
  int autoTvpID;
  int intThingsInventoryLotIdID;
  bool blnThingsInventoryLotUid;
  bool blnIsActive;
  String strThingsInventoryLot;
  double dblQuantityInitial;
  double dblQuantityRemaining;
  double dblCostTotal;

  JsonThingsInventoryLotsDATA(
      {this.autoTvpID,
      this.intThingsInventoryLotIdID,
      this.blnThingsInventoryLotUid,
      this.blnIsActive,
      this.strThingsInventoryLot,
      this.dblQuantityInitial,
      this.dblQuantityRemaining,
      this.dblCostTotal});

  JsonThingsInventoryLotsDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    intThingsInventoryLotIdID = json['intThingsInventoryLot_idID'];
    blnThingsInventoryLotUid = json['blnThingsInventoryLot_Uid'];
    blnIsActive = json['blnIsActive'];
    strThingsInventoryLot = json['strThingsInventoryLot'];
    dblQuantityInitial = json['dblQuantity_Initial'];
    dblQuantityRemaining = json['dblQuantity_Remaining'];
    dblCostTotal = json['dblCost_Total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['intThingsInventoryLot_idID'] = this.intThingsInventoryLotIdID;
    data['blnThingsInventoryLot_Uid'] = this.blnThingsInventoryLotUid;
    data['blnIsActive'] = this.blnIsActive;
    data['strThingsInventoryLot'] = this.strThingsInventoryLot;
    data['dblQuantity_Initial'] = this.dblQuantityInitial;
    data['dblQuantity_Remaining'] = this.dblQuantityRemaining;
    data['dblCost_Total'] = this.dblCostTotal;
    return data;
  }
}

class JsonThingsInventoryLocationsDATA {
  int autoTvpID;
  int intThingsInventoryLocationIdID;
  bool blnThingsInventoryLocationUid;
  bool blnIsActive;
  String strThingsInventoryLocation;
  double dblQuantityCurrent;

  JsonThingsInventoryLocationsDATA(
      {this.autoTvpID,
      this.intThingsInventoryLocationIdID,
      this.blnThingsInventoryLocationUid,
      this.blnIsActive,
      this.strThingsInventoryLocation,
      this.dblQuantityCurrent});

  JsonThingsInventoryLocationsDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    intThingsInventoryLocationIdID = json['intThingsInventoryLocation_idID'];
    blnThingsInventoryLocationUid = json['blnThingsInventoryLocation_Uid'];
    blnIsActive = json['blnIsActive'];
    strThingsInventoryLocation = json['strThingsInventoryLocation'];
    dblQuantityCurrent = json['dblQuantity_Current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['intThingsInventoryLocation_idID'] =
        this.intThingsInventoryLocationIdID;
    data['blnThingsInventoryLocation_Uid'] = this.blnThingsInventoryLocationUid;
    data['blnIsActive'] = this.blnIsActive;
    data['strThingsInventoryLocation'] = this.strThingsInventoryLocation;
    data['dblQuantity_Current'] = this.dblQuantityCurrent;
    return data;
  }
}
