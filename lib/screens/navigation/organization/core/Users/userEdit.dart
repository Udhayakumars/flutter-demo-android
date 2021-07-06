import 'package:MMLMobile/customwidgets/BackButton.dart';
import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/organization/PI_88_PRI_206_PRCI_818_Items.dart';
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

class UserEdit extends StatefulWidgetGS {
  @override
  _UserEditState createState() => _UserEditState();
}

// ignore: camel_case_types
class _UserEditState extends State<UserEdit> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int usersEditPagePI = 102;
  AppDatabase appDatabase;
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
    APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
    // APIConstants.pi_88_PRI_206_PRCI_818_Items.clear();
    // UtilMethods.bef
    UtilMethods.eventRefresh(appDatabase, context);
    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final pi_88_PRI_206_PRCI_818_Items =
        APIConstants.pi_88_PRI_206_PRCI_818_Items.length > 0
            ? APIConstants.pi_88_PRI_206_PRCI_818_Items[0]
            : null;
    TvpCrmUsersDATA tvpUsers_APP_DATA;
    int photosIndex = -1;
    int descriptionIndex =-1;
    int statusIndex =-1;
    if (pi_88_PRI_206_PRCI_818_Items != null) {
      if (pi_88_PRI_206_PRCI_818_Items.tvpCrmUsersDATA != null) {
        tvpUsers_APP_DATA =
            pi_88_PRI_206_PRCI_818_Items.tvpCrmUsersDATA.length > 0
                ? pi_88_PRI_206_PRCI_818_Items.tvpCrmUsersDATA[0]
                : null;
        if (tvpUsers_APP_DATA != null) {

          photosIndex = tvpUsers_APP_DATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 1);
          descriptionIndex = tvpUsers_APP_DATA.jsonCoreTablesEditingSectionsDATA
              .indexWhere((element) => element.intCoreTableSectionID == 2);
          statusIndex = tvpUsers_APP_DATA.jsonCoreTablesEditingSectionsDATA
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
        leading: MELBackButton(database: appDatabase, PI: usersEditPagePI),
        centerTitle: true,
        title: Text(
          '${tvpUsers_APP_DATA.strSummaryID ?? "Person"}',
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
                                    ? GlobalConfiguration().get(
                                    UtilMethods.getStatusIcon(tvpUsers_APP_DATA
                                        .jsonCoreTablesEditingSectionsDATA[
                                    photosIndex]
                                        .intSystemSectionsStatusID))
                                        :
                                      GlobalConfiguration().get("1790"),
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
                          if (pi_88_PRI_206_PRCI_818_Items != null)
                            Column(children: [
                              Container(
                                child: ListTile(
                                  leading: Image.asset(
                                      descriptionIndex != -1
                                      ? GlobalConfiguration().get(
                                      UtilMethods.getStatusIcon(tvpUsers_APP_DATA
                                          .jsonCoreTablesEditingSectionsDATA[
                                      descriptionIndex]
                                          .intSystemSectionsStatusID))
                                          :
                                      GlobalConfiguration().get("1790"),
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
                                            appDatabase, context, 834, 2, null);
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
                                          "${tvpUsers_APP_DATA.strCrmUserName}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height:8),
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
                                          "${tvpUsers_APP_DATA.strUserCode1 ?? ""}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height:8),
                                    Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Job Title: ",
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
                                          "Tester",
                                          style: TextStyle(
                                              fontSize: 17,
                                              // fontWeight:
                                              // FontWeight
                                              //     .bold,
                                              color: Colors.black),
                                        ),
                                      )),
                                    ]),
                                    SizedBox(height:8),
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
                                              "${tvpUsers_APP_DATA.strCrmUserType}",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  // fontWeight:
                                                  // FontWeight
                                                  //     .bold,
                                                  color: Colors.black),
                                            ),
                                          )),
                                    ]),
                                    SizedBox(height:8),
                                    Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Email(Primary): ",
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
                                              "${tvpUsers_APP_DATA.strEmail1 ?? ""}",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  // fontWeight:
                                                  // FontWeight
                                                  //     .bold,
                                                  color: Colors.black),
                                            ),
                                          )),
                                    ]),
                                    SizedBox(height:8),
                                    if(tvpUsers_APP_DATA.strEmail2 != null)
                                    Column(children:[
                                      Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Email(Alternate): ",
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
                                              "${tvpUsers_APP_DATA.strEmail2 ?? ""}",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  // fontWeight:
                                                  // FontWeight
                                                  //     .bold,
                                                  color: Colors.black),
                                            ),
                                          )),
                                    ])]),
                                    SizedBox(height:8),
                                    Row(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Telephone(Primary): ",
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
                                              "${tvpUsers_APP_DATA.strPhone1 ?? ""}",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  // fontWeight:
                                                  // FontWeight
                                                  //     .bold,
                                                  color: Colors.black),
                                            ),
                                          )),
                                    ]),
                                    SizedBox(height:8),
                                    if(tvpUsers_APP_DATA.strPhone2 != null)
                                      Column(children: [
                                        Row(children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Telephone(Alternate): ",
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
                                                  "${tvpUsers_APP_DATA.strPhone2 ?? ""}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      // fontWeight:
                                                      // FontWeight
                                                      //     .bold,
                                                      color: Colors.black),
                                                ),
                                              )),
                                        ])
                                      ]),
                                    SizedBox(height:8),
                                    // if(tvpUsers_APP_DATA.strActiveStatus != null)
                                      Column(children: [
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
                                                  "${tvpUsers_APP_DATA.strActiveStatus}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      // fontWeight:
                                                      // FontWeight
                                                      //     .bold,
                                                      color: Colors.black),
                                                ),
                                              )),
                                        ])
                                      ]),
                                  ]))
                            ]),
                          // Container(
                          //   child: ListTile(
                          //     leading: Image.asset(
                          //         statusIndex != -1
                          //         ? GlobalConfiguration().get(
                          //         UtilMethods.getStatusIcon(tvpUsers_APP_DATA
                          //             .jsonCoreTablesEditingSectionsDATA[
                          //         statusIndex]
                          //             .intSystemSectionsStatusID))
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
                          //               appDatabase, context, 801, 2, null);
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
                          //     child: Row(children: [
                          //       Align(
                          //         alignment: Alignment.topLeft,
                          //         child: Text(
                          //           "${tvpUsers_APP_DATA.strActiveStatus}",
                          //           style: TextStyle(
                          //               fontSize: 17,
                          //               fontWeight: FontWeight.bold,
                          //               color: Colors.black),
                          //         ),
                          //       ),
                          //     ]))
                        ],
                      ))
                    ],
                  ))),
        if (GlobalState.apiLoading) PageDataLoader()
      ]),
    );
  }
}
