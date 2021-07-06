import 'package:MMLMobile/customwidgets/BackButton.dart';
import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/organization/PI_87_PRI_205_PRCI_817_Items.dart';
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

class PlaceEdit extends StatefulWidgetGS {
  @override
  _PlaceEditState createState() => _PlaceEditState();
}

// ignore: camel_case_types
class _PlaceEditState extends State<PlaceEdit> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AppDatabase appDatabase;
  int SiteEditPagePI = 101;
  int childrenCount = 0;
  @override
  void initState() {
    // APIConstants.pi_87_PRI_205_PRCI_817_Items.clear();
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

  @override
  Widget build(BuildContext context) {
    final pi_87_PRI_205_PRCI_817_Items =
        APIConstants.pi_87_PRI_205_PRCI_817_Items.length > 0
            ? APIConstants.pi_87_PRI_205_PRCI_817_Items[0]
            : null;
    TvpCrmSitesDATA tvpSites_APP_DATA;
    List<JsonCrmAddressesDATA> jsonCrmAddresses;
    List<JsonCrmCommunicationsDATA> jsonCrmCommunications;
    if (pi_87_PRI_205_PRCI_817_Items != null) {
      if (pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA != null) {
        tvpSites_APP_DATA =
            pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA.length > 0
                ? pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA[0]
                : null;

        if (tvpSites_APP_DATA != null) {
          jsonCrmAddresses = tvpSites_APP_DATA.jsonCrmAddressesDATA;
          jsonCrmAddresses.sort((a, b) => a.intIndex1.compareTo(b.intIndex1));

          jsonCrmCommunications = tvpSites_APP_DATA.jsonCrmCommunicationsDATA;
          jsonCrmCommunications
              .sort((a, b) => a.intIndex1.compareTo(b.intIndex1));
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

    int photosIndex = -1;
    int descriptionIndex = -1;
    int communicationIndex = -1;
    int addressIndex = -1;
    int statusIndex = -1;

    if (pi_87_PRI_205_PRCI_817_Items != null) {
      if (pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA != null) {
        tvpSites_APP_DATA =
            pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA.length > 0
                ? pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA[0]
                : null;
        if (tvpSites_APP_DATA != null) {
          descriptionIndex = tvpSites_APP_DATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 2);
          communicationIndex = tvpSites_APP_DATA
              .jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 3);
          addressIndex = tvpSites_APP_DATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 4);
          statusIndex = tvpSites_APP_DATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 5);
          photosIndex = tvpSites_APP_DATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 1);
        }
      }
    }
    print(pi_87_PRI_205_PRCI_817_Items);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: MELBackButton(database: appDatabase, PI: SiteEditPagePI),
        centerTitle: true,
        title: Text(
          '${tvpSites_APP_DATA != null ? tvpSites_APP_DATA.strSummaryID : "Place Editing"}',
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
                ? Center(child: CircularProgressIndicator())
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
                                              .getStatusIcon(tvpSites_APP_DATA
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
                          if (pi_87_PRI_205_PRCI_817_Items != null)
                            Column(children: [
                              Container(
                                child: ListTile(
                                  leading: Image.asset(
                                      descriptionIndex != -1
                                          ? GlobalConfiguration().get(UtilMethods
                                              .getStatusIcon(tvpSites_APP_DATA
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
                                            appDatabase, context, 833, 2, null);
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
                                          "${tvpSites_APP_DATA.strCrmSiteName ?? ""}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
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
                                          "${tvpSites_APP_DATA.strUserCode1 ?? ""}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
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
                                      Expanded(
                                          child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${tvpSites_APP_DATA.strCrmSiteType ?? ""}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      )),
                                    ]),
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
                                          "${tvpSites_APP_DATA.strDescription ?? ""}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      )),
                                    ]),
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
                                              "${tvpSites_APP_DATA.strActiveStatus ?? ""}",
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
                              Container(
                                child: ListTile(
                                  leading: Image.asset(
                                      communicationIndex != -1
                                          ? GlobalConfiguration().get(UtilMethods
                                              .getStatusIcon(tvpSites_APP_DATA
                                                  .jsonCoreTablesEditingSectionsDATA[
                                                      communicationIndex]
                                                  .intSystemSectionsStatusID))
                                          : GlobalConfiguration().get("1790"),
                                      height: 25,
                                      width: 25),
                                  title: Text(
                                    "Communications",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () async {
                                        await UtilMethods.eventPageRegionChange(
                                            appDatabase, context, 851, 2, null);
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
                                  child: Column(
                                      children: jsonCrmCommunications.map((e) {
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Row(children: [
                                                Image.asset(
                                                    GlobalConfiguration().get(e
                                                        .intWebAppResourceID
                                                        .toString()),
                                                    height: 17,
                                                    width: 17),
                                                SizedBox(width: 5),
                                                Text(
                                                  "${e.strDescription ?? " - "}:",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                              ])),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Tooltip(
                                              message: e.strData,
                                              child: Text("${e.strData ?? ""}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      // fontWeight: FontWeight.bold,
                                                      color: Colors.black)),
                                            ),
                                          )
                                        ]);
                                  }).toList())),
                              Container(
                                child: ListTile(
                                  leading: Image.asset(
                                      addressIndex != -1
                                          ? GlobalConfiguration().get(UtilMethods
                                              .getStatusIcon(tvpSites_APP_DATA
                                                  .jsonCoreTablesEditingSectionsDATA[
                                                      addressIndex]
                                                  .intSystemSectionsStatusID))
                                          : GlobalConfiguration().get("1790"),
                                      height: 25,
                                      width: 25),
                                  title: Text(
                                    "Addresses",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () async {
                                        await UtilMethods.eventPageRegionChange(
                                            appDatabase, context, 849, 2, null);
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
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "GPS Location: ",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "${tvpSites_APP_DATA.strGpsLocation ?? ""}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        )
                                      ])),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, top: 8, right: 16, bottom: 4),
                                  child: Column(
                                      children: jsonCrmAddresses.map((e) {
                                    return Container(
                                        child: Column(children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${e.strType}:",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            )
                                          ]),
                                      Row(children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 30),
                                            child: Text(
                                                "${e.strCityStateZipCountryMobileApp ?? ""}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.black)))
                                      ]),
                                    ]));
                                  }).toList())),
                              // Container(
                              //   child: ListTile(
                              //     leading: Image.asset(
                              //         statusIndex != -1
                              //             ? GlobalConfiguration().get(UtilMethods
                              //                 .getStatusIcon(tvpSites_APP_DATA
                              //                     .jsonCoreTablesEditingSectionsDATA[
                              //                         statusIndex]
                              //                     .intSystemSectionsStatusID))
                              //             : GlobalConfiguration().get("1790"),
                              //         height: 25,
                              //         width: 25),
                              //     title: Text(
                              //       "Status",
                              //       style: TextStyle(
                              //           fontSize: 20,
                              //           fontWeight: FontWeight.bold,
                              //           color: Colors.blue),
                              //     ),
                              //     trailing: IconButton(
                              //         onPressed: () async {
                              //           await UtilMethods.eventPageRegionChange(
                              //               appDatabase, context, 831, 2, null);
                              //         },
                              //         icon: Icon(
                              //           Icons.mode_edit,
                              //           color: Colors.black,
                              //         )),
                              //   ),
                              //   height: 45,
                              //   width: MediaQuery.of(context).size.width * 1,
                              // ),
                              // Padding(
                              //     padding: EdgeInsets.only(
                              //         left: 20, top: 8, right: 16, bottom: 4),
                              //     child: Column(children: [
                              //       Row(children: [
                              //         Align(
                              //           alignment: Alignment.topLeft,
                              //           child: Text(
                              //             "${tvpSites_APP_DATA.strActiveStatus ?? ""} ",
                              //             style: TextStyle(
                              //                 fontSize: 17,
                              //                 fontWeight: FontWeight.bold,
                              //                 color: Colors.black),
                              //           ),
                              //         ),
                              //       ])
                              //     ]))
                            ])
                        ],
                      ))
                    ],
                  ))),
        if (GlobalState.apiLoading) PageDataLoader()
      ]),
    );
  }
}
