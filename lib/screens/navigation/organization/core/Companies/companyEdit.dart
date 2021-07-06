import 'package:MMLMobile/customwidgets/BackButton.dart';
import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/organization/PI_86_PRI_204_PRCI_816_Items.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Things/ThingsDescriptionEdit.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:global_configuration/global_configuration.dart';
import 'package:global_state/gs.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;

import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import '../FilmStripEdit.dart';

class CompanyEdit extends StatefulWidgetGS {
  @override
  _CompanyEditState createState() => _CompanyEditState();
}

// ignore: camel_case_types
class _CompanyEditState extends State<CompanyEdit> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AppDatabase appDatabase;
  int CompanyEditPagePI = 100;
  @override
  void initState() {
    // APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
    super.initState();
    builder();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  String sasToken;
  builder() async {
    final sasTokenPref = await Preference.getItem('SAS_Token');
    setState(() {
      sasToken = sasTokenPref;
    });
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  Future<Null> _refresh() async {
    // UtilMethods.bef
    UtilMethods.eventRefresh(appDatabase, context);
    setState(() {});
    return null;
  }

  int childrenCount = 0;

  @override
  Widget build(BuildContext context) {
    final pi_86_PRI_204_PRCI_816_Items =
        APIConstants.pi_86_PRI_204_PRCI_816_Items.length > 0
            ? APIConstants.pi_86_PRI_204_PRCI_816_Items[0]
            : null;
    TvpCrmCompaniesDATA tvpCompanys_APP_DATA;
    int photosIndex = -1;
    int descriptionIndex = -1;
    int statusIndex = -1;
    if (pi_86_PRI_204_PRCI_816_Items != null) {
      if (pi_86_PRI_204_PRCI_816_Items.tvpCrmCompaniesDATA != null) {
        tvpCompanys_APP_DATA =
            pi_86_PRI_204_PRCI_816_Items.tvpCrmCompaniesDATA.length > 0
                ? pi_86_PRI_204_PRCI_816_Items.tvpCrmCompaniesDATA[0]
                : null;
        if (tvpCompanys_APP_DATA != null) {
          photosIndex = tvpCompanys_APP_DATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 1);
          descriptionIndex = tvpCompanys_APP_DATA
              .jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 2);
          statusIndex = tvpCompanys_APP_DATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 3);
        }
      }
    }

    if (APIConstants.pi_89_PRI_207_PRCI_785_Items.length > 0) {
      if (APIConstants
              .pi_89_PRI_207_PRCI_785_Items[0].HEADER[0].INITIAL_INDEX1 !=
          null) {
        setState(() {
          childrenCount = APIConstants
                  .pi_89_PRI_207_PRCI_785_Items[0].HEADER[0].CHILDREN_COUNT +
              1;
        });
      }
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: MELBackButton(database: appDatabase, PI: CompanyEditPagePI),
        centerTitle: true,
        title: Text(
          '${tvpCompanys_APP_DATA != null ? tvpCompanys_APP_DATA.strSummaryID : "Company"}',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Stack(children: [
        Visibility(
          child: Text(GlobalState.pageDataLoaded.toString()),
          visible: false,
        ),
        LiquidPullToRefresh(
            borderWidth: 1,
            height: 50,
            animSpeedFactor: 6,
            color: Colors.white,
            backgroundColor: Colors.blueAccent,
            springAnimationDurationInMilliseconds: 500,
            onRefresh: _refresh,
            showChildOpacityTransition: false,
            child: !GlobalState.pageDataLoaded
                ? Text("")
                : Container(
                    child: Column(
                    children: [
                      Expanded(
                          child: ListView(
                        children: [
                          Container(
                            child: ListView(
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                      photosIndex != -1
                                          ? GlobalConfiguration().get(UtilMethods
                                              .getStatusIcon(tvpCompanys_APP_DATA
                                                  .jsonCoreTablesEditingSectionsDATA[
                                                      photosIndex]
                                                  .intSystemSectionsStatusID))
                                          : GlobalConfiguration().get("1790"),
                                      height: 25,
                                      width: 25),
                                  title: Text(
                                    "${childrenCount > 0 ? "Photos" : "Add Photos "}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () async {
                                        await UtilMethods.eventPageRegionChange(
                                            appDatabase, context, 794, 2, null);
                                      },
                                      icon: Icon(
                                        Icons.mode_edit,
                                        color: Colors.black,
                                      )),
                                ),
                                if (APIConstants
                                        .pi_89_PRI_207_PRCI_785_Items.length >
                                    0)
                                  ListTile(
                                    title: SingleChildScrollView(
                                      child: APIConstants
                                                  .pi_89_PRI_207_PRCI_785_Items[
                                                      0]
                                                  .CHILDREN
                                                  .length >
                                              0
                                          ? Row(
                                              children: APIConstants
                                                  .pi_89_PRI_207_PRCI_785_Items[
                                                      0]
                                                  .CHILDREN
                                                  .map((item) {
                                              UtilMethods.evictImage(
                                                  "${item?.URL_STRIP_VIEW.toString() + sasToken}");
                                              return GestureDetector(
                                                  onTap: () async {
                                                    UtilMethods
                                                        .eventPageRegionChange(
                                                            appDatabase,
                                                            context,
                                                            790,
                                                            2,
                                                            item.RK);
                                                  },
                                                  child: FadeInImage
                                                      .assetNetwork(
                                                          height: MediaQuery
                                                                      .of(
                                                                          context)
                                                                  .size
                                                                  .height *
                                                              0.10,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.35,
                                                          image:
                                                              "${item?.URL_STRIP_VIEW.toString() + sasToken}",
                                                          placeholder:
                                                              GlobalConfiguration()
                                                                  .get("-1"),
                                                          imageErrorBuilder:
                                                              (c, v, b) {
                                                            return Image.asset(
                                                              GlobalConfiguration()
                                                                  .get("1603"),
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.10,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.35,
                                                            );
                                                          }));
                                            }).toList())
                                          : Row(children: [
                                              Image.asset(
                                                GlobalConfiguration().get("98"),
                                                height: 100,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                              )
                                            ]),
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  )
                              ],
                            ),
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.width * 1,
                          ),
                          if (pi_86_PRI_204_PRCI_816_Items != null)
                            Column(children: [
                              Container(
                                child: ListTile(
                                  leading: Image.asset(
                                      descriptionIndex != -1
                                          ? GlobalConfiguration().get(UtilMethods
                                              .getStatusIcon(tvpCompanys_APP_DATA
                                                  .jsonCoreTablesEditingSectionsDATA[
                                                      descriptionIndex]
                                                  .intSystemSectionsStatusID))
                                          : GlobalConfiguration().get("1790"),
                                      height: 25,
                                      width: 25),
                                  title: Text(
                                    "Description",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () async {
                                        await UtilMethods.eventPageRegionChange(
                                            appDatabase, context, 832, 2, null);
                                      },
                                      icon: Icon(
                                        Icons.mode_edit,
                                        color: Colors.black,
                                      )),
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 1,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, top: 8, right: 16, bottom: 4),
                                  child: Column(children: [
                                    Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Name: ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                    Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${tvpCompanys_APP_DATA.strCrmCompanyName}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: 8),
                                    Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "User Code: ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                    Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${tvpCompanys_APP_DATA.strUserCode1}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: 8),
                                    Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Type: ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                    Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${tvpCompanys_APP_DATA.strCrmCompanyType}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: 8),
                                    Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Description: ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                    Row(children: [
                                      Expanded(
                                          child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${tvpCompanys_APP_DATA.strDescription}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      )),
                                    ]),
                                    SizedBox(height: 8),
                                    Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Founded: ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                    Row(children: [
                                      Expanded(
                                          child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${tvpCompanys_APP_DATA.strFounded ?? ""}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      )),
                                    ]),
                                    SizedBox(height: 8),
                                    Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Status: ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                    Row(children: [
                                      Expanded(
                                          child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${tvpCompanys_APP_DATA.strActiveStatus}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      )),
                                    ]),
                                  ])),
                            ]),
                        ],
                      ))
                    ],
                  ))),
        if (GlobalState.apiLoading) PageDataLoader()
      ]),
    );
  }
}
