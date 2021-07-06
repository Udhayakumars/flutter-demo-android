import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:MMLMobile/customwidgets/BackButton.dart';
import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/screens/LoginScreenV.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:tuple/tuple.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import '../NavigationCalls.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController _tabController;
  AppDatabase appDatabase;
  int notificationPagePI = 39;
  int notificationPagePRI = 139;

  @override
  void initState() {
    builder();
    _tabController = new TabController(length: _widgets.length, vsync: this);
    super.initState();
  }

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> _widgets = [
    Icon(Icons.settings),
    Icon(Icons.message_outlined),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: MELBackButton(database: appDatabase, PI: notificationPagePI),
          title: Text(
            "Notification Settings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Colors.blue),
          bottom: TabBar(
            labelPadding: EdgeInsets.all(2),
            indicatorColor: Colors.blueAccent, // 3C89CB
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blueAccent,
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2.0,
            indicatorPadding: EdgeInsets.only(left: 2.0, right: 2.0),
            isScrollable: false,
            physics: ScrollPhysics(),
            tabs: [
              Tab(text: 'Settings'),
              Tab(text: 'Messages'),
            ],
            onTap: onTabTapped,
          ),
        ),
        // backgroundColor: Colors.grey[300],
        body: Stack(children: [
          ListView(children: <Widget>[
            Column(children: <Widget>[
              Center(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Icon(Icons.settings),
                    Icon(Icons.message_outlined),
                  ],
                ),
              ),
            ]),
          ]),
          if (GlobalState.apiLoading) PageDataLoader()
        ]));
  }

  void onTabTapped(int index) {
    //todo
  }
}
