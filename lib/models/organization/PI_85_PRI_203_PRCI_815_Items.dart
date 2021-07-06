class PI_85_PRI_203_PRCI_815_Items {
  List<TvpAccountsDATA> tvpAccountsDATA;

  PI_85_PRI_203_PRCI_815_Items({this.tvpAccountsDATA});

  PI_85_PRI_203_PRCI_815_Items.fromJson(Map<String, dynamic> json) {
    if (json['tvpAccounts_DATA'] != null) {
      tvpAccountsDATA = new List<TvpAccountsDATA>();
      json['tvpAccounts_DATA'].forEach((v) {
        tvpAccountsDATA.add(new TvpAccountsDATA.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tvpAccountsDATA != null) {
      data['tvpAccounts_DATA'] =
          this.tvpAccountsDATA.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TvpAccountsDATA {
  int autoTvpID;
  int idID;
  bool blnUid;
  String strActiveStatus;
  String strCreatedDate;
  String strCreatedBy;
  String strAccountName;
  String strDomain;
  String strAccountType;
  String strAdministrator;
  String strPaidTo;
  String strUserCode1;
  List<JsonCoreTablesEditingSectionsDATA> jsonCoreTablesEditingSectionsDATA;
  List<JsonStatisticsCrmSitesDATA> jsonStatisticsCrmSitesDATA;
  List<JsonStatisticsCrmUsersDATA> jsonStatisticsCrmUsersDATA;
  List<JsonStatisticsThingsDATA> jsonStatisticsThingsDATA;
  List<JsonStatisticsStorageItemsDATA> jsonStatisticsStorageItemsDATA;

  TvpAccountsDATA(
      {this.autoTvpID,
        this.idID,
        this.blnUid,
        this.strActiveStatus,
        this.strCreatedDate,
        this.strCreatedBy,
        this.strAccountName,
        this.strDomain,
        this.strAccountType,
        this.strAdministrator,
        this.strPaidTo,
        this.strUserCode1,
        this.jsonCoreTablesEditingSectionsDATA,
        this.jsonStatisticsCrmSitesDATA,
        this.jsonStatisticsCrmUsersDATA,
        this.jsonStatisticsThingsDATA,
        this.jsonStatisticsStorageItemsDATA});

  TvpAccountsDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    idID = json['idID'];
    blnUid = json['blnUid'];
    strActiveStatus = json['strActiveStatus'];
    strCreatedDate = json['strCreatedDate'];
    strCreatedBy = json['strCreatedBy'];
    strAccountName = json['strAccountName'];
    strDomain = json['strDomain'];
    strAccountType = json['strAccountType'];
    strAdministrator = json['strAdministrator'];
    strPaidTo = json['strPaidTo'];
    strUserCode1 = json['strUserCode1'];
    if (json['jsonCoreTablesEditingSections_DATA'] != null) {
      jsonCoreTablesEditingSectionsDATA =
      new List<JsonCoreTablesEditingSectionsDATA>();
      json['jsonCoreTablesEditingSections_DATA'].forEach((v) {
        jsonCoreTablesEditingSectionsDATA
            .add(new JsonCoreTablesEditingSectionsDATA.fromJson(v));
      });
    }
    if (json['jsonStatistics_CrmSites_DATA'] != null) {
      jsonStatisticsCrmSitesDATA = new List<JsonStatisticsCrmSitesDATA>();
      json['jsonStatistics_CrmSites_DATA'].forEach((v) {
        jsonStatisticsCrmSitesDATA
            .add(new JsonStatisticsCrmSitesDATA.fromJson(v));
      });
    }
    if (json['jsonStatistics_CrmUsers_DATA'] != null) {
      jsonStatisticsCrmUsersDATA = new List<JsonStatisticsCrmUsersDATA>();
      json['jsonStatistics_CrmUsers_DATA'].forEach((v) {
        jsonStatisticsCrmUsersDATA
            .add(new JsonStatisticsCrmUsersDATA.fromJson(v));
      });
    }
    if (json['jsonStatistics_Things_DATA'] != null) {
      jsonStatisticsThingsDATA = new List<JsonStatisticsThingsDATA>();
      json['jsonStatistics_Things_DATA'].forEach((v) {
        jsonStatisticsThingsDATA.add(new JsonStatisticsThingsDATA.fromJson(v));
      });
    }
    if (json['jsonStatistics_StorageItems_DATA'] != null) {
      jsonStatisticsStorageItemsDATA =
      new List<JsonStatisticsStorageItemsDATA>();
      json['jsonStatistics_StorageItems_DATA'].forEach((v) {
        jsonStatisticsStorageItemsDATA
            .add(new JsonStatisticsStorageItemsDATA.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['idID'] = this.idID;
    data['blnUid'] = this.blnUid;
    data['strActiveStatus'] = this.strActiveStatus;
    data['strCreatedDate'] = this.strCreatedDate;
    data['strCreatedBy'] = this.strCreatedBy;
    data['strAccountName'] = this.strAccountName;
    data['strDomain'] = this.strDomain;
    data['strAccountType'] = this.strAccountType;
    data['strAdministrator'] = this.strAdministrator;
    data['strPaidTo'] = this.strPaidTo;
    if (this.jsonCoreTablesEditingSectionsDATA != null) {
      data['jsonCoreTablesEditingSections_DATA'] = this
          .jsonCoreTablesEditingSectionsDATA
          .map((v) => v.toJson())
          .toList();
    }
    if (this.jsonStatisticsCrmSitesDATA != null) {
      data['jsonStatistics_CrmSites_DATA'] =
          this.jsonStatisticsCrmSitesDATA.map((v) => v.toJson()).toList();
    }
    if (this.jsonStatisticsCrmUsersDATA != null) {
      data['jsonStatistics_CrmUsers_DATA'] =
          this.jsonStatisticsCrmUsersDATA.map((v) => v.toJson()).toList();
    }
    if (this.jsonStatisticsThingsDATA != null) {
      data['jsonStatistics_Things_DATA'] =
          this.jsonStatisticsThingsDATA.map((v) => v.toJson()).toList();
    }
    if (this.jsonStatisticsStorageItemsDATA != null) {
      data['jsonStatistics_StorageItems_DATA'] =
          this.jsonStatisticsStorageItemsDATA.map((v) => v.toJson()).toList();
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

class JsonStatisticsCrmSitesDATA {
  String strType;
  int strCount;

  JsonStatisticsCrmSitesDATA({this.strType, this.strCount});

  JsonStatisticsCrmSitesDATA.fromJson(Map<String, dynamic> json) {
    strType = json['strType'];
    strCount = json['strCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strType'] = this.strType;
    data['strCount'] = this.strCount;
    return data;
  }
}

class JsonStatisticsThingsDATA {
  String strSkuCount;
  String strInventoryValue;

  JsonStatisticsThingsDATA({this.strSkuCount, this.strInventoryValue});

  JsonStatisticsThingsDATA.fromJson(Map<String, dynamic> json) {
    strSkuCount = json['strSkuCount'];
    strInventoryValue = json['strInventoryValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strSkuCount'] = this.strSkuCount;
    data['strInventoryValue'] = this.strInventoryValue;
    return data;
  }
}

class JsonStatisticsStorageItemsDATA {
  String strStorageItemsCount;
  String strPagesCount;
  String strIdentifiedPartNumbers;

  JsonStatisticsStorageItemsDATA(
      {this.strStorageItemsCount,
        this.strPagesCount,
        this.strIdentifiedPartNumbers});

  JsonStatisticsStorageItemsDATA.fromJson(Map<String, dynamic> json) {
    strStorageItemsCount = json['strStorageItemsCount'];
    strPagesCount = json['strPagesCount'];
    strIdentifiedPartNumbers = json['strIdentifiedPartNumbers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strStorageItemsCount'] = this.strStorageItemsCount;
    data['strPagesCount'] = this.strPagesCount;
    data['strIdentifiedPartNumbers'] = this.strIdentifiedPartNumbers;
    return data;
  }
}
class JsonStatisticsCrmUsersDATA {
  String strType;
  int strCount;

  JsonStatisticsCrmUsersDATA({this.strType, this.strCount});

  JsonStatisticsCrmUsersDATA.fromJson(Map<String, dynamic> json) {
    strType = json['strType'];
    strCount = json['strCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strType'] = this.strType;
    data['strCount'] = this.strCount;
    return data;
  }
}