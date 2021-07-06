import 'package:MMLMobile/customwidgets/BackButton.dart';
import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/organization/PI_85_PRI_203_PRCI_815_Items.dart';
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

class AccountEdit extends StatefulWidgetGS {
  @override
  _AccountEditState createState() => _AccountEditState();
}

// ignore: camel_case_types
class _AccountEditState extends State<AccountEdit> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AppDatabase appDatabase;
  int AccountEditPagePI = 99;
  int childrenCount = 0;
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

  @override
  Widget build(BuildContext context) {
    final pi_85_PRI_203_PRCI_815_Items =
        APIConstants.pi_85_PRI_203_PRCI_815_Items.length > 0
            ? APIConstants.pi_85_PRI_203_PRCI_815_Items[0]
            : null;

    TvpAccountsDATA tvpAccounts_APP_DATA;
    int photosIndex = -1;
    int subscriptionIndex = -1;
    int descriptionIndex = -1;

    int statusIndex = -1;
    if (pi_85_PRI_203_PRCI_815_Items != null) {
      if (pi_85_PRI_203_PRCI_815_Items.tvpAccountsDATA != null) {
        tvpAccounts_APP_DATA =
            pi_85_PRI_203_PRCI_815_Items.tvpAccountsDATA.length > 0
                ? pi_85_PRI_203_PRCI_815_Items.tvpAccountsDATA[0]
                : null;
        if (tvpAccounts_APP_DATA != null) {
          photosIndex = tvpAccounts_APP_DATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 1);
          descriptionIndex = tvpAccounts_APP_DATA
              .jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 2);
          subscriptionIndex = tvpAccounts_APP_DATA
              .jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 3);
          statusIndex = tvpAccounts_APP_DATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 4);
        }
      }
    }

    if (APIConstants.pi_89_PRI_207_PRCI_785_Items.length > 0) {
      if (APIConstants
              .pi_89_PRI_207_PRCI_785_Items[0].HEADER[0].INITIAL_INDEX1 !=
          null) {
        setState(() {
          // initialImageIndex = APIConstants
          //     .pi_89_PRI_207_PRCI_785_Items[0].HEADER[0].INITIAL_INDEX1 -
          //     1;
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
        leading: MELBackButton(database: appDatabase, PI: AccountEditPagePI),
        centerTitle: true,
        title: Text(
          "ACCOUNT",
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
            child: pi_85_PRI_203_PRCI_815_Items == null
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
                                              .getStatusIcon(tvpAccounts_APP_DATA
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
                          if (pi_85_PRI_203_PRCI_815_Items != null)
                            Column(children: [
                              Container(
                                child: ListTile(
                                  leading: Image.asset(
                                      descriptionIndex != -1
                                          ? GlobalConfiguration().get(UtilMethods
                                              .getStatusIcon(tvpAccounts_APP_DATA
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
                                          "${tvpAccounts_APP_DATA.strAccountName ?? ""}",
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
                                          "UserCode: ",
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
                                          "${tvpAccounts_APP_DATA.strUserCode1 ?? ""}",
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
                                          "Domain: ",
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
                                          "${tvpAccounts_APP_DATA.strDomain ?? ""}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                  ])),
                              // Column(children: [
                              Container(
                                child: ListTile(
                                  leading: Image.asset(
                                      subscriptionIndex != -1
                                          ? GlobalConfiguration().get(UtilMethods
                                              .getStatusIcon(tvpAccounts_APP_DATA
                                                  .jsonCoreTablesEditingSectionsDATA[
                                                      subscriptionIndex]
                                                  .intSystemSectionsStatusID))
                                          : GlobalConfiguration().get("1790"),
                                      height: 25,
                                      width: 25),
                                  title: Text(
                                    "Subscription",
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
                                  child: Column(children: [
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
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${tvpAccounts_APP_DATA.strActiveStatus ?? ""}",
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
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${tvpAccounts_APP_DATA.strAccountType}",
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
                                          "Expires: ",
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
                                          "${tvpAccounts_APP_DATA.strPaidTo}",
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
                              // Container(
                              //   child: ListTile(
                              //     leading: Image.asset(
                              //         statusIndex != -1
                              //         ? GlobalConfiguration().get(
                              //         UtilMethods.getStatusIcon(tvpAccounts_APP_DATA
                              //             .jsonCoreTablesEditingSectionsDATA[
                              //         statusIndex]
                              //             .intSystemSectionsStatusID))
                              //         :
                              //         GlobalConfiguration().get("1790"),
                              //         height: 25,
                              //         width: 25),
                              //     title: Text(
                              //       "Status - Terminate option",
                              //       style: TextStyle(
                              //           fontSize: 20,
                              //           fontWeight: FontWeight.bold,
                              //           color: Colors.blue),
                              //     ),
                              //     trailing: IconButton(
                              //         onPressed: () async {
                              //           await UtilMethods.eventPageRegionChange(
                              //               appDatabase, context, 849, 2, null);
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
                              //             "${tvpAccounts_APP_DATA.strActiveStatus} ",
                              //             style: TextStyle(
                              //                 fontSize: 17,
                              //                 fontWeight: FontWeight.bold,
                              //                 color: Colors.black),
                              //           ),
                              //         ),
                              //       ]),
                              //       // Row(children: [
                              //       //   Align(
                              //       //     alignment: Alignment.topLeft,
                              //       //     child: Text(
                              //       //       "${tvpAccounts_APP_DATA.strPaidTo}",
                              //       //       style: TextStyle(
                              //       //           fontSize: 17,
                              //       //           // fontWeight:
                              //       //           // FontWeight
                              //       //           //     .bold,
                              //       //           color: Colors.black),
                              //       //     ),
                              //       //   ),
                              //       // ])
                              //     ]))
                            ]),
                        ],
                      )),
                      if (GlobalState.apiLoading) PageDataLoader()
                    ],
                  )))
      ]),
    );
  }
}
