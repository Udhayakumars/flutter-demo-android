class PI_86_PRI_204_PRCI_816_Items {
  List<TvpCrmCompaniesDATA> tvpCrmCompaniesDATA;

  PI_86_PRI_204_PRCI_816_Items({this.tvpCrmCompaniesDATA});

  PI_86_PRI_204_PRCI_816_Items.fromJson(Map<String, dynamic> json) {
    if (json['tvpCrmCompanies_DATA'] != null) {
      tvpCrmCompaniesDATA = new List<TvpCrmCompaniesDATA>();
      json['tvpCrmCompanies_DATA'].forEach((v) {
        tvpCrmCompaniesDATA.add(new TvpCrmCompaniesDATA.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tvpCrmCompaniesDATA != null) {
      data['tvpCrmCompanies_DATA'] =
          this.tvpCrmCompaniesDATA.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TvpCrmCompaniesDATA {
  int autoTvpID;
  int autoID;
  int idID;
  bool blnUid;
  bool blnIsActive;
  String strActiveStatus;
  String strCreatedDate;
  String strCreatedBy;
  int intOrganizationNode1AutoID;
  String strCrmCompanyName;
  String strUserCode1;
  String strDescription;
  String strCrmCompanyType;
  String strFounded;
  String strSummaryID;
  String strSummaryIcon;
  String strSummaryDescription;
  List<JsonCoreTablesEditingSectionsDATA> jsonCoreTablesEditingSectionsDATA;

  TvpCrmCompaniesDATA(
      {this.autoTvpID,
        this.autoID,
        this.idID,
        this.blnUid,
        this.blnIsActive,
        this.strActiveStatus,
        this.strCreatedDate,
        this.strCreatedBy,
        this.intOrganizationNode1AutoID,
        this.strCrmCompanyName,
        this.strUserCode1,
        this.strDescription,
        this.strCrmCompanyType,
        this.strFounded,
        this.strSummaryID,
        this.strSummaryIcon,
        this.strSummaryDescription,
        this.jsonCoreTablesEditingSectionsDATA});

  TvpCrmCompaniesDATA.fromJson(Map<String, dynamic> json) {
    autoTvpID = json['autoTvpID'];
    autoID = json['autoID'];
    idID = json['idID'];
    blnUid = json['blnUid'];
    blnIsActive = json['blnIsActive'];
    strActiveStatus = json['strActiveStatus'];
    strCreatedDate = json['strCreatedDate'];
    strCreatedBy = json['strCreatedBy'];
    intOrganizationNode1AutoID = json['intOrganizationNode1_autoID'];
    strCrmCompanyName = json['strCrmCompanyName'];
    strUserCode1 = json['strUserCode1'];
    strDescription = json['strDescription'];
    strCrmCompanyType = json['strCrmCompanyType'];
    strFounded = json['strFounded'];
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
    data['strCrmCompanyName'] = this.strCrmCompanyName;
    data['strUserCode1'] = this.strUserCode1;
    data['strDescription'] = this.strDescription;
    data['strCrmCompanyType'] = this.strCrmCompanyType;
    data['strFounded'] = this.strFounded;
    data['strSummary_ID'] = this.strSummaryID;
    data['strSummary_Icon'] = this.strSummaryIcon;
    data['strSummaryDescription'] = this.strSummaryDescription;
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
