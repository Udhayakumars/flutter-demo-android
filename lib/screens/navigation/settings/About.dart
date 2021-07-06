import 'dart:convert';

import 'package:MMLMobile/customwidgets/BackButton.dart';
import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/ResponseBody.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/Rkeys.dart';
import 'package:MMLMobile/models/RowItem.dart';
import 'package:MMLMobile/models/RowSources.dart';
import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/screens/navigation/home/Settings.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:global_configuration/global_configuration.dart';
import 'package:global_state/gs.dart';
import 'package:toast/toast.dart';

import '../NavigationCalls.dart';

class About extends StatefulWidgetGS {
  final ResponseBody recents;
  const About({Key key, this.recents}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  RowItem _rowItem;
  AppDatabase appDatabase;
  int aboutPagePI = 81;
  int aboutPagePRI = 181;

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  @override
  void initState() {
    // loadPageData();
    builder();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          leading: MELBackButton(database: appDatabase, PI: aboutPagePI),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            'assets/images/home_logo.jpg',
            height: 130,
            width: 250,
          )),
      // backgroundColor: Colors.grey[300],
      body: Stack(children: [
        new Center(
          child: new Container(
            // padding: EdgeInsets.only(),
            width: MediaQuery.of(context).size.width * 1.0,
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.all(0),
                        child: ListView(
                          children: [
                            Card(
                              color: Colors.grey[300],
                              elevation: 1,
                              child: ListTile(
                                  title: Text(
                                    "Version",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  trailing: Text("6.9.5")),
                            ),
                            Card(
                              color: Colors.grey[300],
                              child: ListTile(
                                title: Text(
                                  "Legal  ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                trailing: IconButton(
                                  icon: Image.asset(
                                    GlobalConfiguration().get('0030'),
                                  ),
                                  iconSize: 20,
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (_) =>
                                    //             NotificationSettings()));
                                  },
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
        if (GlobalState.apiLoading) PageDataLoader()
      ]),
    );
  }
}
