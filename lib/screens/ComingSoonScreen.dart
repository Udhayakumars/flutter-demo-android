import 'dart:async';
import 'dart:convert';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/InputConvertExitObjects.dart';
import 'package:MMLMobile/models/InputObject.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/ResponseBody.dart';
import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:MMLMobile/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:global_state/gs.dart';


class ComingSoonScreen extends StatefulWidgetGS {
  @override
  _ComingSoonScreenState createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  AppDatabase appDatabase;


  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  @override
  void initState() {
    builder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () async {
                UtilMethods.eventBack(appDatabase, context, GlobalState.PI);
              }),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            'assets/images/home_logo.jpg',
            height: 130,
            width: 250,
          )),
      body: new Center(
        child: new Text("Coming Soon...",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
      ),
    );
  }
}
