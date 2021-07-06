import 'dart:convert';

import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/ResponseBody.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/Rkeys.dart';
import 'package:MMLMobile/models/RowItem.dart';
import 'package:MMLMobile/models/RowSources.dart';
import 'package:MMLMobile/models/settings/PI_30_PRI_187_PRCI_716_Items.dart';
import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/screens/SplashScreen.dart';
import 'package:MMLMobile/screens/navigation/settings/About.dart';
import 'package:MMLMobile/screens/navigation/settings/ChangePassword.dart';
import 'package:MMLMobile/screens/navigation/settings/Debug.dart';
import 'package:MMLMobile/screens/navigation/settings/Notification.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:global_configuration/global_configuration.dart';
import 'package:global_state/gs.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:toast/toast.dart';
import 'dart:async';

class SettingsTabScreen extends StatefulWidgetGS {
  final ResponseBody recents;
  // final int backPI;
  // final int backPRI;
  const SettingsTabScreen({Key key, this.recents}) : super(key: key);

  @override
  _SettingsTabScreenState createState() => _SettingsTabScreenState();
}

class _SettingsTabScreenState extends State<SettingsTabScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  RowItem _rowItem;
  AppDatabase appDatabase;
  int settingsPagePI = 30;
  int settingsPagePRI = 187;
  bool apiError = false;

  bool _isLoading = false;

  List<PI_30_PRI_187_PRCI_716_Items> _pi_30_PRI_187_PRCI_716_Items = [];

  Timer timer;
  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  @override
  void initState() {
    // GlobalState.initContext = context;
    // loadPageData();
    builder();
  }

  @override
  void deactivate() {
    if (timer != null) {
      timer.cancel();
    }
    super.deactivate();
    // GlobalState.disposeContext = context;
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
    // GlobalState.disposeContext = context;
  }

  // @override
  // void setState(fn) {
  //   if (mounted) {
  //     super.setState(fn);
  //   }
  // }

  // loadPageData() async {
  //   // _pi_30_PRI_187_PRCI_716_Items = [];

  //   GlobalState.pageDataLoaded = false;
  //   if (_pi_30_PRI_187_PRCI_716_Items.length == 0) {
  //     await setSettings();
  //     GlobalState.pageDataLoaded = true;
  //   }
  // }

  Future<void> _refresh() async {
    //Holding pull to refresh loader widget for 2 sec.
    //You can fetch data from server.
    print('refreshing ...');

    // UtilMethods.bef
    await UtilMethods.eventRefresh(appDatabase, context);

    // await new Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    _pi_30_PRI_187_PRCI_716_Items = APIConstants.pi_30_PRI_187_PRCI_716_Items;
    print("settings called");
    return new Scaffold(
        key: _scaffoldKey,
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
              child: _pi_30_PRI_187_PRCI_716_Items.length == 0
                  ? Text("")
                  : Opacity(
                      opacity: _isLoading ? 0.1 : 1.0,
                      child: new ListView(
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              // height: MediaQuery.of(context).size.height * 1.0,
                              child: Column(children: [
                                ListView.builder(
                                    itemCount:
                                        _pi_30_PRI_187_PRCI_716_Items.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final item =
                                          _pi_30_PRI_187_PRCI_716_Items[index];
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height -
                                                10,
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: ListView(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20,
                                                      bottom: 4,
                                                      top: 4),
                                                  child: Text('My Info',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black))),
                                              Padding(
                                                padding: EdgeInsets.all(20),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              item.S1A + " :",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              item.S1B,
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  // fontWeight: FontWeight.bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          )
                                                        ]),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              item.S2A + " :",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              item.S2B,
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  // fontWeight: FontWeight.bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          )
                                                        ]),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              item.S3A + " :",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              item.S3B,
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  // fontWeight: FontWeight.bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          )
                                                        ]),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              item.S4A + " :",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              item.S4B,
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  // fontWeight: FontWeight.bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          )
                                                        ]),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              item.S5A + " :",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              item.S5B,
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  // fontWeight: FontWeight.bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          )
                                                        ]),
                                                    Card(
                                                      color: Colors.grey[300],
                                                      elevation: 1,
                                                      child: ListTile(
                                                        title: Text(
                                                          "Change Password",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        trailing: IconButton(
                                                          icon: Image.asset(
                                                            GlobalConfiguration()
                                                                .get('0030'),
                                                          ),
                                                          iconSize: 20,
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ChangePassword()));
                                                          },
                                                        ),
                                                        onTap: () {
                                                          //Todo

                                                          UtilMethods
                                                              .eventPageRegionChange(
                                                                  appDatabase,
                                                                  context,
                                                                  745,
                                                                  2,
                                                                  null);
                                                          // Navigator.of(context)
                                                          //     .pushReplacementNamed(
                                                          //         GlobalConfiguration()
                                                          //             .get("37"));
                                                        },
                                                      ),
                                                    ),
                                                    Card(
                                                      color: Colors.grey[300],
                                                      child: ListTile(
                                                        title: Text(
                                                          "Notification",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        trailing: IconButton(
                                                          icon: Image.asset(
                                                            GlobalConfiguration()
                                                                .get('0030'),
                                                          ),
                                                          iconSize: 20,
                                                          onPressed: () {
                                                            UtilMethods
                                                                .eventPageRegionChange(
                                                                    appDatabase,
                                                                    context,
                                                                    746,
                                                                    2,
                                                                    null);
                                                          },
                                                        ),
                                                        onTap: () {
                                                          UtilMethods
                                                              .eventPageRegionChange(
                                                                  appDatabase,
                                                                  context,
                                                                  746,
                                                                  2,
                                                                  null);
                                                        },
                                                      ),
                                                    ),
                                                    Card(
                                                      color: Colors.grey[300],
                                                      child: ListTile(
                                                        title: Text(
                                                          "About",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        trailing: IconButton(
                                                          icon: Image.asset(
                                                            GlobalConfiguration()
                                                                .get('0030'),
                                                          ),
                                                          iconSize: 20,
                                                          onPressed: () {
                                                            //Todo
                                                            UtilMethods
                                                                .eventPageRegionChange(
                                                                    appDatabase,
                                                                    context,
                                                                    747,
                                                                    2,
                                                                    null);
                                                          },
                                                        ),
                                                        onTap: () {
                                                          //Todo
                                                          UtilMethods
                                                              .eventPageRegionChange(
                                                                  appDatabase,
                                                                  context,
                                                                  747,
                                                                  2,
                                                                  null);
                                                        },
                                                      ),
                                                    ),
                                                    Card(
                                                      color: Colors.grey[300],
                                                      child: ListTile(
                                                        title: Text(
                                                          "Debug",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        trailing: IconButton(
                                                          icon: Image.asset(
                                                            GlobalConfiguration()
                                                                .get('0030'),
                                                          ),
                                                          iconSize: 20,
                                                          onPressed: () {
                                                            UtilMethods
                                                                .eventPageRegionChange(
                                                                    appDatabase,
                                                                    context,
                                                                    748,
                                                                    2,
                                                                    null);
                                                            Navigator.of(
                                                                    context)
                                                                .pushReplacementNamed(
                                                                    GlobalConfiguration()
                                                                        .get(
                                                                            "83"));
                                                          },
                                                        ),
                                                        onTap: () async {
                                                          UtilMethods
                                                              .eventPageRegionChange(
                                                                  appDatabase,
                                                                  context,
                                                                  748,
                                                                  2,
                                                                  null);
                                                          Navigator.of(context)
                                                              .pushReplacementNamed(
                                                                  GlobalConfiguration()
                                                                      .get(
                                                                          "83"));
                                                          //Todo
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(20),
                                                      child: Column(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          20),
                                                              child:
                                                                  MaterialButton(
                                                                      textColor:
                                                                          Colors
                                                                              .white,
                                                                      color: Colors
                                                                          .red,
                                                                      child: Text(
                                                                          "Sign Out"),
                                                                      onPressed:
                                                                          () async {
                                                                        await UtilMethods.eventLogout(
                                                                            context);
                                                                      }),
                                                              //Your widget here,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                              ]))
                        ],
                      ))),
          if (GlobalState.apiLoading) PageDataLoader()
        ]));
  }
}
