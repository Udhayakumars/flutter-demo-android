import 'dart:convert';

import 'package:MMLMobile/customwidgets/BackButton.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/ResponseBody.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/Rkeys.dart';
import 'package:MMLMobile/models/RowItem.dart';
import 'package:MMLMobile/models/RowSources.dart';
import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/screens/navigation/home/Settings.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:global_configuration/global_configuration.dart';
import 'package:toast/toast.dart';

import '../NavigationCalls.dart';

class Debug extends StatefulWidget {
  final ResponseBody recents;

  const Debug({Key key, this.recents}) : super(key: key);

  @override
  _DebugState createState() => _DebugState();
}

class _DebugState extends State<Debug> {
  RowItem _rowItem;
  AppDatabase appDatabase;
  int debugPagePI = 83;
  int debugPagePRI = 183;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    builder();
  }

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: MELBackButton(database: appDatabase, PI: debugPagePI),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Image.asset(
              'assets/images/home_logo.jpg',
              height: 130,
              width: 250,
            )),
        body: Stack(children: [
          new Center(
            child: new Container(
              // padding: EdgeInsets.only(),
              width: MediaQuery.of(context).size.width * 1.0,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 20, bottom: 5, top: 10),
                        child: ListView(
                          children: [
                            Text(
                              "AC_DK\n",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "Email:",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(
                              "Mobile  :",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(
                              "User Type :",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
