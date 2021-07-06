import 'package:MMLMobile/customwidgets/BackButton.dart';
import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
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

class LocationEdit extends StatefulWidgetGS {
  @override
  _LocationEditState createState() => _LocationEditState();
}

// ignore: camel_case_types
class _LocationEditState extends State<LocationEdit> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AppDatabase appDatabase;
  int LocationEditPagePI = 99;
  @override
  void initState() {
    APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
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
    final pi_99_PRI_217_PRCI_821_Items =
        APIConstants.pi_99_PRI_217_PRCI_821_Items.length > 0
            ? APIConstants.pi_99_PRI_217_PRCI_821_Items[0]
            : null;

    int childrenCount = 0;
    if (APIConstants.pi_89_PRI_207_PRCI_785_Items.length > 0) {
      childrenCount =
          APIConstants.pi_89_PRI_207_PRCI_785_Items[0].HEADER[0].CHILDREN_COUNT;
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: MELBackButton(database: appDatabase, PI: LocationEditPagePI),
        centerTitle: true,
        title: Text(
          "Location Editing",
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
                                  leading: childrenCount > 0
                                      ? Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          Icons.add_a_photo_outlined,
                                          color: Colors.black,
                                        ),
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
                                // if (APIConstants
                                //     .pi_89_PRI_207_PRCI_785_Items.length >
                                //     0)
                                //   ListTile(
                                //     title: SingleChildScrollView(
                                //       child: Row(
                                //           children: APIConstants
                                //               .pi_89_PRI_207_PRCI_785_Items[0]
                                //               .CHILDREN
                                //               .map((item) {
                                //             UtilMethods.evictImage(
                                //                 "${item?.URL_STRIP_VIEW.toString() + sasToken}");
                                //             return GestureDetector(
                                //                 onTap: () async {
                                //                   UtilMethods.eventPageRegionChange(
                                //                       appDatabase,
                                //                       context,
                                //                       790,
                                //                       2,
                                //                       item.RK);
                                //                 },
                                //                 child: FadeInImage.assetNetwork(
                                //                     height: MediaQuery.of(context)
                                //                         .size
                                //                         .height *
                                //                         0.10,
                                //                     width: MediaQuery.of(context)
                                //                         .size
                                //                         .width *
                                //                         0.35,
                                //                     image:
                                //                     "${item?.URL_STRIP_VIEW.toString() + sasToken}",
                                //                     placeholder:
                                //                     GlobalConfiguration()
                                //                         .get("-1"),
                                //                     imageErrorBuilder: (c, v, b) {
                                //                       return Image.asset(
                                //                         GlobalConfiguration()
                                //                             .get("1603"),
                                //                         height:
                                //                         MediaQuery.of(context)
                                //                             .size
                                //                             .height *
                                //                             0.10,
                                //                         width:
                                //                         MediaQuery.of(context)
                                //                             .size
                                //                             .width *
                                //                             0.35,
                                //                       );
                                //                     }));
                                //           }).toList()),
                                //       scrollDirection: Axis.horizontal,
                                //     ),
                                //   )
                              ],
                            ),
                            height: MediaQuery.of(context).size.height * 0.20
                                ,
                            width: MediaQuery.of(context).size.width * 1,
                          ),
                          // Container(
                          //   child: ListView(
                          //     children: [
                          //       ListTile(
                          //         leading: Icon(
                          //           Icons.check_circle,
                          //           color: Colors.green,
                          //         ),
                          //         title: Padding(
                          //             padding: EdgeInsets.only(top: 10),
                          //             child: Text(
                          //               "Name",
                          //               style: TextStyle(
                          //                   fontSize: 20,
                          //                   fontWeight: FontWeight.bold,
                          //                   color: Colors.black),
                          //             )),
                          //         subtitle: Padding(
                          //             padding: EdgeInsets.only(top: 10),
                          //             child: Text(
                          //               "${pi_99_PRI_217_PRCI_821_Items.NAME}",
                          //               style: TextStyle(
                          //                   fontSize: 18,
                          //                   fontWeight: FontWeight.normal,
                          //                   color: Colors.black),
                          //             )),
                          //         trailing: IconButton(
                          //             onPressed: () async {
                          //               await UtilMethods.eventPageRegionChange(
                          //                   appDatabase, context, 801, 2, null);
                          //             },
                          //             icon: Icon(
                          //               Icons.mode_edit,
                          //               color: Colors.black,
                          //             )),
                          //       ),
                          //     ],
                          //   ),
                          //   height: MediaQuery.of(context).size.height * 0.10,
                          //   width: MediaQuery.of(context).size.width * 1,
                          // ),
                          // Container(
                          //   child: ListView(
                          //     children: [
                          //       ListTile(
                          //         leading: Icon(
                          //           Icons.check_circle,
                          //           color: Colors.green,
                          //         ),
                          //         title: Padding(
                          //           child: Text(
                          //             "Specifications",
                          //             style: TextStyle(
                          //                 fontSize: 20,
                          //                 fontWeight: FontWeight.bold,
                          //                 color: Colors.black),
                          //           ),
                          //           padding: EdgeInsets.only(top: 10),
                          //         ),
                          //         subtitle: Padding(
                          //           padding: EdgeInsets.only(top: 20),
                          //           child: Column(
                          //             children: [
                          //               Padding(
                          //                   padding: EdgeInsets.only(top: 5),
                          //                   child: Row(
                          //                     children: [
                          //                       Align(
                          //                         child: Text(
                          //                           "Manufacturer",
                          //                           style: TextStyle(
                          //                               fontSize: 16,
                          //                               fontWeight:
                          //                               FontWeight.normal,
                          //                               color: Colors.black),
                          //                         ),
                          //                         alignment: Alignment.topLeft,
                          //                       ),
                          //                       Padding(
                          //                         padding:
                          //                         EdgeInsets.only(left: 15),
                          //                         child: Align(
                          //                           child: Text(
                          //                             "${pi_99_PRI_217_PRCI_821_Items.MANUFACTURER}",
                          //                             style: TextStyle(
                          //                                 fontSize: 16,
                          //                                 fontWeight:
                          //                                 FontWeight.bold,
                          //                                 color: Colors.black),
                          //                           ),
                          //                           alignment:
                          //                           Alignment.topRight,
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   )),
                          //               Padding(
                          //                   padding: EdgeInsets.only(top: 5),
                          //                   child: Row(
                          //                     children: [
                          //                       Align(
                          //                         child: Text(
                          //                           "Serial Number",
                          //                           style: TextStyle(
                          //                               fontSize: 16,
                          //                               fontWeight:
                          //                               FontWeight.normal,
                          //                               color: Colors.black),
                          //                         ),
                          //                         alignment: Alignment.topLeft,
                          //                       ),
                          //                       Padding(
                          //                         padding:
                          //                         EdgeInsets.only(left: 10),
                          //                         child: Align(
                          //                           child: Text(
                          //                             "${pi_99_PRI_217_PRCI_821_Items.SERIAL_NUMBER}",
                          //                             style: TextStyle(
                          //                                 fontSize: 16,
                          //                                 fontWeight:
                          //                                 FontWeight.bold,
                          //                                 color: Colors.black),
                          //                           ),
                          //                           alignment:
                          //                           Alignment.topRight,
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   )),
                          //               Padding(
                          //                   padding: EdgeInsets.only(top: 5),
                          //                   child: Row(
                          //                     children: [
                          //                       Align(
                          //                         child: Text(
                          //                           "Acquired",
                          //                           style: TextStyle(
                          //                               fontSize: 16,
                          //                               fontWeight:
                          //                               FontWeight.normal,
                          //                               color: Colors.black),
                          //                         ),
                          //                         alignment: Alignment.topLeft,
                          //                       ),
                          //                       Padding(
                          //                         padding:
                          //                         EdgeInsets.only(left: 50),
                          //                         child: Align(
                          //                           child: Text(
                          //                             "${pi_99_PRI_217_PRCI_821_Items.ACQUIRED ?? " - "}",
                          //                             style: TextStyle(
                          //                                 fontSize: 16,
                          //                                 fontWeight:
                          //                                 FontWeight.bold,
                          //                                 color: Colors.black),
                          //                           ),
                          //                           alignment:
                          //                           Alignment.topRight,
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   )),
                          //               Padding(
                          //                   padding: EdgeInsets.only(top: 5),
                          //                   child: Row(
                          //                     children: [
                          //                       Align(
                          //                         child: Text(
                          //                           "Location",
                          //                           style: TextStyle(
                          //                               fontSize: 16,
                          //                               fontWeight:
                          //                               FontWeight.normal,
                          //                               color: Colors.black),
                          //                         ),
                          //                         alignment: Alignment.topLeft,
                          //                       ),
                          //                       Padding(
                          //                           padding: EdgeInsets.only(
                          //                               left: 50),
                          //                           child: Align(
                          //                               alignment:
                          //                               Alignment.topLeft,
                          //                               child: Column(
                          //                                   children: pi_99_PRI_217_PRCI_821_Items
                          //                                       .LOCATIONS
                          //                                       .length >
                          //                                       0
                          //                                       ? pi_99_PRI_217_PRCI_821_Items
                          //                                       .LOCATIONS
                          //                                       .map((e) =>
                          //                                       Row(children: [
                          //                                         Text(
                          //                                           "${e.LOC}",
                          //                                           style: TextStyle(
                          //                                               fontSize: 16,
                          //                                               fontWeight: FontWeight.bold,
                          //                                               color: Colors.black),
                          //                                         )
                          //                                       ]))
                          //                                       .toList()
                          //                                       : []))),
                          //                     ],
                          //                   )),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   height: MediaQuery.of(context).size.height * 0.30,
                          //   width: MediaQuery.of(context).size.width * 1,
                          // ),
                        ],
                      ))
                    ],
                  ))),
        if(GlobalState.apiLoading) PageDataLoader()
      ]),
    );
  }
}
