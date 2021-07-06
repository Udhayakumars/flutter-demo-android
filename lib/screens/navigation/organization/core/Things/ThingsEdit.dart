import 'package:MMLMobile/customwidgets/BackButton.dart';
import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/organization/PRCI_786_Items.dart';
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

class ThingsEdit extends StatefulWidgetGS {
  @override
  _thingsEditState createState() => _thingsEditState();
}

// ignore: camel_case_types
class _thingsEditState extends State<ThingsEdit> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AppDatabase appDatabase;
  int thingsEditPagePI = 93;
  @override
  void initState() {
    // GlobalState.initContext = context;
    // APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
    // APIConstants.page_PRCI_786_Items.clear();
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
    final pi_89_PRI_207_PRCI_786_Items =
        APIConstants.page_PRCI_786_Items.length > 0
            ? APIConstants.page_PRCI_786_Items[0]
            : null;

    TvpThingsDATA tvpThingsDATA;
    int photosIndex = -1;
    int descriptionIndex = -1;
    int inventoryCountIndex = -1;
    int inventorySettingsIndex = -1;
    int makeAndModelIndex = -1;
    int statusIndex = -1;

    if (pi_89_PRI_207_PRCI_786_Items != null) {
      if (pi_89_PRI_207_PRCI_786_Items.tvpThingsDATA != null) {
        tvpThingsDATA = pi_89_PRI_207_PRCI_786_Items.tvpThingsDATA.length > 0
            ? pi_89_PRI_207_PRCI_786_Items.tvpThingsDATA[0]
            : null;
        if (tvpThingsDATA != null) {
          descriptionIndex = tvpThingsDATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 2);
          inventoryCountIndex = tvpThingsDATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 5);
          inventorySettingsIndex = tvpThingsDATA
              .jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 4);
          makeAndModelIndex = tvpThingsDATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 3);
          photosIndex = tvpThingsDATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 1);
          statusIndex = tvpThingsDATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 6);
          print(statusIndex);
          print(photosIndex);
          print(makeAndModelIndex);

        }
      }
    }

    int manufacturerIndex = 0;
    int childrenCount = 0;
    if (APIConstants.pi_89_PRI_207_PRCI_785_Items.length > 0) {
      childrenCount =
          APIConstants.pi_89_PRI_207_PRCI_785_Items[0].HEADER[0].CHILDREN_COUNT;
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: MELBackButton(database: appDatabase, PI: thingsEditPagePI),
        centerTitle: true,
        title: Text(
          '${tvpThingsDATA.strSummaryID ?? "Thing"}',
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
            child: Container(
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
                                    ? GlobalConfiguration().get(
                                        UtilMethods.getStatusIcon(tvpThingsDATA
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
                                  color: Colors.black),
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
                          if (APIConstants.pi_89_PRI_207_PRCI_785_Items.length >
                              0)
                            ListTile(
                              title: SingleChildScrollView(
                                child: APIConstants
                                            .pi_89_PRI_207_PRCI_785_Items[0]
                                            .CHILDREN
                                            .length >
                                        0
                                    ? Row(
                                        children: APIConstants
                                            .pi_89_PRI_207_PRCI_785_Items[0]
                                            .CHILDREN
                                            .map((item) {
                                        UtilMethods.evictImage(
                                            "${item?.URL_STRIP_VIEW.toString() + sasToken}");
                                        return GestureDetector(
                                            onTap: () async {
                                              UtilMethods.eventPageRegionChange(
                                                  appDatabase,
                                                  context,
                                                  790,
                                                  2,
                                                  item.RK);
                                            },
                                            child: FadeInImage.assetNetwork(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.10,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                image:
                                                    "${item?.URL_STRIP_VIEW.toString() + sasToken}",
                                                placeholder:
                                                    GlobalConfiguration()
                                                        .get("-1"),
                                                imageErrorBuilder: (c, v, b) {
                                                  return Image.asset(
                                                    GlobalConfiguration()
                                                        .get("1603"),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.10,
                                                    width:
                                                        MediaQuery.of(context)
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
                    if (pi_89_PRI_207_PRCI_786_Items != null)
                      Column(children: [
                        Container(
                          child: ListTile(
                            leading: Image.asset(
                                descriptionIndex != -1
                                    ? GlobalConfiguration().get(
                                        UtilMethods.getStatusIcon(tvpThingsDATA
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
                                      appDatabase, context, 801, 2, null);
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
                                    "${tvpThingsDATA.strThingName}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        // fontWeight:
                                        // FontWeight
                                        //     .bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ]),
                              SizedBox(height: 8,),
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
                                    "${tvpThingsDATA.strUserCode1}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        // fontWeight:
                                        // FontWeight
                                        //     .bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ]),
                              SizedBox(height: 8,),
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
                                    "${tvpThingsDATA.strThingType}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        // fontWeight:
                                        // FontWeight
                                        //     .bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ]),
                              SizedBox(height: 8,),
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
                                    "${tvpThingsDATA.strDescription}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        // fontWeight:
                                        // FontWeight
                                        //     .bold,
                                        color: Colors.black),
                                  ),
                                )),
                              ]),
                              SizedBox(height: 8,),
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
                                        "${tvpThingsDATA.strActiveStatus}",
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
                                makeAndModelIndex != -1
                                    ? GlobalConfiguration().get(
                                        UtilMethods.getStatusIcon(tvpThingsDATA
                                            .jsonCoreTablesEditingSectionsDATA[
                                                makeAndModelIndex]
                                            .intSystemSectionsStatusID))
                                    : GlobalConfiguration().get("1790"),
                                height: 25,
                                width: 25),
                            title: Text(
                              "Make & Model",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            trailing: IconButton(
                                onPressed: () async {
                                  await UtilMethods.eventPageRegionChange(
                                      appDatabase, context, 831, 2, null);
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
                                children: tvpThingsDATA.jsonThingsSourcesDATA
                                    .map((e) {
                              manufacturerIndex += 1;
                              return Column(children: [
                                Row(children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Manufacturer #${manufacturerIndex}: ",
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
                                      "${e.strManufacturer}",
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
                                      "Model/Part number:",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ]),
                                Row(children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "${e.strModel}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          // fontWeight:
                                          // FontWeight
                                          //     .bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ]),
                                SizedBox(
                                  height: 10,
                                )
                              ]);
                            }).toList())),
                        Container(
                          child: ListTile(
                            leading: Image.asset(
                                inventorySettingsIndex != -1
                                    ? GlobalConfiguration().get(
                                        UtilMethods.getStatusIcon(tvpThingsDATA
                                            .jsonCoreTablesEditingSectionsDATA[
                                                inventorySettingsIndex]
                                            .intSystemSectionsStatusID))
                                    : GlobalConfiguration().get("1790"),
                                height: 25,
                                width: 25),
                            title: Text(
                              "Inventory Settings",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            trailing: IconButton(
                                onPressed: () async {
                                  await UtilMethods.eventPageRegionChange(
                                      appDatabase, context, 831, 2, null);
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
                                    "Total on Hand & Value:",
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
                                    "${tvpThingsDATA.jsonThingsInventorySummaryDATA[0].strTotalOnHandAndValue}",
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
                                    "Levels:",
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
                                    "${tvpThingsDATA.jsonThingsInventorySummaryDATA[0].strPurchasingLevels}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        // fontWeight:
                                        // FontWeight
                                        //     .bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ])
                            ])),
                        Container(
                          child: ListTile(
                            leading: Image.asset(
                                inventoryCountIndex != -1
                                    ? GlobalConfiguration().get(
                                        UtilMethods.getStatusIcon(tvpThingsDATA
                                            .jsonCoreTablesEditingSectionsDATA[
                                                inventoryCountIndex]
                                            .intSystemSectionsStatusID))
                                    : GlobalConfiguration().get("1790"),
                                height: 25,
                                width: 25),
                            title: Text(
                              "Inventory Counts",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            trailing: IconButton(
                                onPressed: () async {
                                  await UtilMethods.eventPageRegionChange(
                                      appDatabase, context, 831, 2, null);
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
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Locations",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        "Units(feet)",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ]),
                              Column(
                                  children: tvpThingsDATA
                                      .jsonThingsInventoryLocationsDATA
                                      .map((e) {
                                return Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "${e.strThingsInventoryLocation}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            "${e.dblQuantityCurrent}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ]),
                                ]);
                              }).toList()),
                              SizedBox(height: 10),
                              Row(
                                  // mainAxisAlignment:
                                  // MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                30,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Lots",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        )),
                                    SizedBox(
                                        width: ((MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2) /
                                                2) +
                                            10,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            "Initial",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        )),
                                    SizedBox(
                                        width: ((((MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2) /
                                                    2)) /
                                                2) +
                                            30,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            "Current",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        )),
                                  ]),
                              Column(
                                  children: tvpThingsDATA
                                      .jsonThingsInventoryLotsDATA
                                      .map((e) {
                                return Column(children: [
                                  Row(
                                      // mainAxisAlignment:
                                      // MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2) -
                                                30,
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "${e.strThingsInventoryLot}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            )),
                                        SizedBox(
                                            width: ((MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2) /
                                                    2) +
                                                10,
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                "${e.dblQuantityInitial}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            )),
                                        SizedBox(
                                            width: ((((MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2) /
                                                        2)) /
                                                    2) +
                                                30,
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                "${e.dblCostTotal}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            )),
                                      ])
                                ]);
                              }).toList())
                            ])),
                        // Container(
                        //   child: ListTile(
                        //     leading: Image.asset(
                        //         statusIndex != -1
                        //             ? GlobalConfiguration().get(
                        //             UtilMethods.getStatusIcon(tvpThingsDATA
                        //                 .jsonCoreTablesEditingSectionsDATA[
                        //             statusIndex]
                        //                 .intSystemSectionsStatusID))
                        //             :
                        //         GlobalConfiguration().get("1790"),
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
                        //             "Active ",
                        //             style: TextStyle(
                        //                 fontSize: 17,
                        //                 fontWeight: FontWeight.bold,
                        //                 color: Colors.black),
                        //           ),
                        //         ),
                        //       ])
                        //     ]))
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
