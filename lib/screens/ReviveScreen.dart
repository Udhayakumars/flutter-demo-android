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

class ReviveScreen extends StatefulWidget {
  @override
  _ReviveScreenState createState() => _ReviveScreenState();
}

class _ReviveScreenState extends State<ReviveScreen> {
  AppDatabase appDatabase;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
    if (await Preference.containsKey("IsLoggedIn")) {
      UtilMethods.eventRevive(appDatabase, context);
    }
  }

  showAlertDialog(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // Create button
    Widget updateButton = FlatButton(
        onPressed: () {
          print('while Update and then Move');
          var _duration = new Duration(seconds: 1);
          // return new Timer(_duration, navigationPage);
        },
        child: Center(
          child: Container(
            child: Text(
              'Update',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.yellowAccent),
            ),
          ),
        ));

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.grey,
      title: Text(
        "Mandatory Mobile App Update",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.

          return Container(
            height: height * 0.08,
            width: width * 0.90,
            child: Text(
              "In order to continue, you must update this mobile app now. This should take only few moments.",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
      actions: [
        Padding(
          padding: EdgeInsets.zero,
          child: updateButton,
        )
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    builder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key:_scaffoldKey,
      body: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
}
