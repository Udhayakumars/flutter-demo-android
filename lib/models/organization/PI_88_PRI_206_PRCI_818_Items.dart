class PI_88_PRI_206_PRCI_818_Items {
  List<TvpCrmUsersDATA> tvpCrmUsersDATA;

  PI_88_PRI_206_PRCI_818_Items({this.tvpCrmUsersDATA});

  PI_88_PRI_206_PRCI_818_Items.fromJson(Map<String, dynamic> json) {
    if (json['tvpCrmUsers_DATA'] != null) {
      tvpCrmUsersDATA = new List<TvpCrmUsersDATA>();
      json['tvpCrmUsers_DATA'].forEach((v) {
        tvpCrmUsersDATA.add(new TvpCrmUsersDATA.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tvpCrmUsersDATA != null) {
      data['tvpCrmUsers_DATA'] =
          this.tvpCrmUsersDATA.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TvpCrmUsersDATA {
  int autoTvpID;
  int idID;
  bool blnUid;
  bool blnIsActive;
  String strSummaryID;
  String strActiveStatus;
  String strCreatedDate;
  String strCreatedBy;
  String strCrmUserName;
  String strFirstName;
  String strMiddleName;
  String strLastName;
  String strCrmUserType;
  String strUserCode1;
  String strPhone1;
  String strPhone2;
  String strEmail1;
  String strEmail2;
  int intOrganizationNode1_autoID;
  List<JsonCoreTablesEditingSectionsDATA> jsonCoreTablesEditingSectionsDATA;

  TvpCrmUsersDATA(
      {this.autoTvpID,
        this.idID,
        this.blnUid,
        this.blnIsActive,
        this.strSummaryID,
        this.strActiveStatus,
        this.strCreatedDate,
        this.strCreatedBy,
        this.strCrmUserName,
        this.strFirstName,
        this.strMiddleName,
        this.strLastName,
        this.strCrmUserType,
        this.strUserCode1,
        this.strPhone1,
        this.strPhone2,
        this.strEmail1,
        this.strEmail2,
        this.intOrganizationNode1_autoID,
        this.jsonCoreTablesEditingSectionsDATA});

  TvpCrmUsersDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    strSummaryID = json['strSummary_ID'];
    blnIsActive = json['blnIsActive'];
    idID = json['idID'];
    blnUid = json['blnUid'];
    intOrganizationNode1_autoID = json['intOrganizationNode1_autoID'];
    strActiveStatus = json['strActiveStatus'];
    strCreatedDate = json['strCreatedDate'];
    strCreatedBy = json['strCreatedBy'];
    strCrmUserName = json['strCrmUserName'];
    strFirstName = json['strFirstName'];
    strMiddleName = json['strMiddleName'];
    strLastName = json['strLastName'];
    strCrmUserType = json['strCrmUserType'];
    strUserCode1 = json['strUserCode1'];
    strPhone1 = json['strPhone1'];
    strPhone2 = json['strPhone2'];
    strEmail1 = json['strEmail1'];
    strEmail2 = json['strEmail2'];
    if (json['jsonCoreTablesEditingSections_DATA'] != null) {
      jsonCoreTablesEditingSectionsDATA =
      new List<JsonCoreTablesEditingSectionsDATA>();
      json['jsonCoreTablesEditingSections_DATA'].forEach((v) {
        jsonCoreTablesEditingSectionsDATA
            .add(new JsonCoreTablesEditingSectionsDATA.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoTvpID'] = this.autoTvpID;
    data['idID'] = this.idID;
    data['blnUid'] = this.blnUid;
    data['strActiveStatus'] = this.strActiveStatus;
    data['intOrganizationNode1_autoID'] = this.intOrganizationNode1_autoID;
    data['strCreatedDate'] = this.strCreatedDate;
    data['strCreatedBy'] = this.strCreatedBy;
    data['strCrmUserName'] = this.strCrmUserName;
    data['strFirstName'] = this.strFirstName;
    data['strMiddleName'] = this.strMiddleName;
    data['strLastName'] = this.strLastName;
    data['strCrmUserType'] = this.strCrmUserType;
    data['strUserCode1'] = this.strUserCode1;
    data['strPhone1'] = this.strPhone1;
    data['strPhone2'] = this.strPhone2;
    data['strEmail1'] = this.strEmail1;
    data['strEmail2'] = this.strEmail2;
    if (this.jsonCoreTablesEditingSectionsDATA != null) {
      data['jsonCoreTablesEditingSections_DATA'] = this
          .jsonCoreTablesEditingSectionsDATA
          .map((v) => v.toJson())
          .toList();
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
