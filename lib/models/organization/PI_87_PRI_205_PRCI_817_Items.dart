class PI_87_PRI_205_PRCI_817_Items {
  List<TvpCrmSitesDATA> tvpCrmSitesDATA;

  PI_87_PRI_205_PRCI_817_Items({this.tvpCrmSitesDATA});

  PI_87_PRI_205_PRCI_817_Items.fromJson(Map<String, dynamic> json) {
    if (json['tvpCrmSites_DATA'] != null) {
      tvpCrmSitesDATA = new List<TvpCrmSitesDATA>();
      json['tvpCrmSites_DATA'].forEach((v) {
        tvpCrmSitesDATA.add(new TvpCrmSitesDATA.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tvpCrmSitesDATA != null) {
      data['tvpCrmSites_DATA'] =
          this.tvpCrmSitesDATA.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TvpCrmSitesDATA {
  int autoTvpID;
  int autoID;
  int idID;
  bool blnUid;
  bool blnIsActive;
  String strActiveStatus;
  String strCreatedDate;
  String strCreatedBy;
  int intOrganizationNode1AutoID;
  String strCrmSiteName;
  String strUserCode1;
  String strDescription;
  String strCrmSiteType;
  String strGpsLocation;
  double dblPrimaryLatitude;
  double dblPrimaryLongitude;
  int intGeographyTimeZoneID;
  String strGeographyTimeZone;
  String strSummaryID;
  String strSummaryIcon;
  String strSummaryDescription;
  List<JsonCoreTablesEditingSectionsDATA> jsonCoreTablesEditingSectionsDATA;
  List<JsonCrmAddressesDATA> jsonCrmAddressesDATA;
  List<JsonCrmCommunicationsDATA> jsonCrmCommunicationsDATA;
  List<JsonStatisticsCrmUsersDATA> jsonStatisticsCrmUsersDATA;
  List<JsonStatisticsThingsDATA> jsonStatisticsThingsDATA;
  List<JsonStatisticsStorageItemsDATA> jsonStatisticsStorageItemsDATA;

  TvpCrmSitesDATA(
      {this.autoTvpID,
        this.autoID,
        this.idID,
        this.blnUid,
        this.blnIsActive,
        this.strActiveStatus,
        this.strCreatedDate,
        this.strCreatedBy,
        this.intOrganizationNode1AutoID,
        this.strCrmSiteName,
        this.strUserCode1,
        this.strDescription,
        this.strCrmSiteType,
        this.strGpsLocation,
        this.dblPrimaryLatitude,
        this.dblPrimaryLongitude,
        this.intGeographyTimeZoneID,
        this.strGeographyTimeZone,
        this.strSummaryID,
        this.strSummaryIcon,
        this.strSummaryDescription,
        this.jsonCoreTablesEditingSectionsDATA,
        this.jsonCrmAddressesDATA,
        this.jsonCrmCommunicationsDATA,
        this.jsonStatisticsCrmUsersDATA,
        this.jsonStatisticsThingsDATA,
        this.jsonStatisticsStorageItemsDATA});

  TvpCrmSitesDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    autoID = json['autoID'];
    idID = json['idID'];
    blnUid = json['blnUid'];
    blnIsActive = json['blnIsActive'];
    strActiveStatus = json['strActiveStatus'];
    strCreatedDate = json['strCreatedDate'];
    strCreatedBy = json['strCreatedBy'];
    intOrganizationNode1AutoID = json['intOrganizationNode1_autoID'];
    strCrmSiteName = json['strCrmSiteName'];
    strUserCode1 = json['strUserCode1'];
    strDescription = json['strDescription'];
    strCrmSiteType = json['strCrmSiteType'];
    strGpsLocation = json['strGpsLocation'];
    dblPrimaryLatitude = json['dblPrimaryLatitude'];
    dblPrimaryLongitude = json['dblPrimaryLongitude'];
    intGeographyTimeZoneID = json['intGeographyTimeZoneID'];
    strGeographyTimeZone = json['strGeographyTimeZone'];
    strSummaryID = json['strSummary_ID'];
    strSummaryIcon = json['strSummary_Icon'];
    strSummaryDescription = json['strSummaryDescription'];
    if (json['jsonCoreTablesEditingSections_DATA'] != null) {
      jsonCoreTablesEditingSectionsDATA =
      new List<JsonCoreTablesEditingSectionsDATA>();
      json['jsonCoreTablesEditingSections_DATA'].forEach((v) {
        jsonCoreTablesEditingSectionsDATA
            .add(new JsonCoreTablesEditingSectionsDATA.fromJson(v));
      });
    }
    if (json['jsonCrmAddresses_DATA'] != null) {
      jsonCrmAddressesDATA = new List<JsonCrmAddressesDATA>();
      json['jsonCrmAddresses_DATA'].forEach((v) {
        jsonCrmAddressesDATA.add(new JsonCrmAddressesDATA.fromJson(v));
      });
    }
    if (json['jsonCrmCommunications_DATA'] != null) {
      jsonCrmCommunicationsDATA = new List<JsonCrmCommunicationsDATA>();
      json['jsonCrmCommunications_DATA'].forEach((v) {
        jsonCrmCommunicationsDATA
            .add(new JsonCrmCommunicationsDATA.fromJson(v));
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
    data['autoID'] = this.autoID;
    data['idID'] = this.idID;
    data['blnUid'] = this.blnUid;
    data['blnIsActive'] = this.blnIsActive;
    data['strActiveStatus'] = this.strActiveStatus;
    data['strCreatedDate'] = this.strCreatedDate;
    data['strCreatedBy'] = this.strCreatedBy;
    data['intOrganizationNode1_autoID'] = this.intOrganizationNode1AutoID;
    data['strCrmSiteName'] = this.strCrmSiteName;
    data['strUserCode1'] = this.strUserCode1;
    data['strDescription'] = this.strDescription;
    data['strCrmSiteType'] = this.strCrmSiteType;
    data['strGpsLocation'] = this.strGpsLocation;
    data['dblPrimaryLatitude'] = this.dblPrimaryLatitude;
    data['dblPrimaryLongitude'] = this.dblPrimaryLongitude;
    data['intGeographyTimeZoneID'] = this.intGeographyTimeZoneID;
    data['strGeographyTimeZone'] = this.strGeographyTimeZone;
    data['strSummary_ID'] = this.strSummaryID;
    data['strSummary_Icon'] = this.strSummaryIcon;
    data['strSummaryDescription'] = this.strSummaryDescription;
    if (this.jsonCoreTablesEditingSectionsDATA != null) {
      data['jsonCoreTablesEditingSections_DATA'] = this
          .jsonCoreTablesEditingSectionsDATA
          .map((v) => v.toJson())
          .toList();
    }
    if (this.jsonCrmAddressesDATA != null) {
      data['jsonCrmAddresses_DATA'] =
          this.jsonCrmAddressesDATA.map((v) => v.toJson()).toList();
    }
    if (this.jsonCrmCommunicationsDATA != null) {
      data['jsonCrmCommunications_DATA'] =
          this.jsonCrmCommunicationsDATA.map((v) => v.toJson()).toList();
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

class JsonCrmAddressesDATA {
  int autoTvpID;
  int autoID;
  int intGeographyCountryID;
  int intGeographyRegionID;
  String strCityName;
  String strPostalCode;
  String strAddress1;
  String strAddress2;
  String strType;
  String strCityStateZipCountryWebApp;
  String strCityStateZipCountryMobileApp;
  int intIndex1;

  JsonCrmAddressesDATA(
      {this.autoTvpID,
        this.autoID,
        this.intGeographyCountryID,
        this.intGeographyRegionID,
        this.strCityName,
        this.strPostalCode,
        this.strAddress1,
        this.strAddress2,
        this.strType,
        this.strCityStateZipCountryWebApp,
        this.strCityStateZipCountryMobileApp,
        this.intIndex1});

  JsonCrmAddressesDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    autoID = json['autoID'];
    intGeographyCountryID = json['intGeographyCountryID'];
    intGeographyRegionID = json['intGeographyRegionID'];
    strCityName = json['strCityName'];
    strPostalCode = json['strPostalCode'];
    strAddress1 = json['strAddress1'];
    strAddress2 = json['strAddress2'];
    strType = json['strType'];
    strCityStateZipCountryWebApp = json['strCityStateZipCountry_WebApp'];
    strCityStateZipCountryMobileApp = json['strCityStateZipCountry_MobileApp'];
    intIndex1 = json['intIndex1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['autoID'] = this.autoID;
    data['intGeographyCountryID'] = this.intGeographyCountryID;
    data['intGeographyRegionID'] = this.intGeographyRegionID;
    data['strCityName'] = this.strCityName;
    data['strPostalCode'] = this.strPostalCode;
    data['strAddress1'] = this.strAddress1;
    data['strAddress2'] = this.strAddress2;
    data['strType'] = this.strType;
    data['strCityStateZipCountry_WebApp'] = this.strCityStateZipCountryWebApp;
    data['strCityStateZipCountry_MobileApp'] =
        this.strCityStateZipCountryMobileApp;
    data['intIndex1'] = this.intIndex1;
    return data;
  }
}

class JsonCrmCommunicationsDATA {
  int autoTvpID;
  int autoID;
  int intWebAppResourceID;
  String strDescription;
  String strData;
  int intIndex1;

  JsonCrmCommunicationsDATA(
      {this.autoTvpID,
        this.autoID,
        this.intWebAppResourceID,
        this.strDescription,
        this.strData,
        this.intIndex1});

  JsonCrmCommunicationsDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    autoID = json['autoID'];
    intWebAppResourceID = json['intWebAppResourceID'];
    strDescription = json['strDescription'];
    strData = json['strData'];
    intIndex1 = json['intIndex1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['autoID'] = this.autoID;
    data['intWebAppResourceID'] = this.intWebAppResourceID;
    data['strDescription'] = this.strDescription;
    data['strData'] = this.strData;
    data['intIndex1'] = this.intIndex1;
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
