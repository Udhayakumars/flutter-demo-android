import 'dart:async';
import 'dart:convert';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/InputConvertExitObjects.dart';
import 'package:MMLMobile/models/InputObject.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/ResponseBody.dart';
import 'package:MMLMobile/models/recents/PI_30_PRI_127_PRCI_656_Items.dart';
import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 AppDatabase database;
 final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ///Going check the version and give the Notification the user
  versionCheck(String mamVer, String localMAM) async {

    var serverMAM = "";
    var localMAMV = "";
    if (localMAM != "" && mamVer != "") {
      print(mamVer.split(".")[0] + "." + mamVer.split(".")[1]);
      print(localMAM.split(".")[0] + "." + localMAM.split(".")[1]);
      serverMAM = mamVer.split(".")[0] + "." + mamVer.split(".")[1];
      localMAMV = localMAM.split(".")[0] + "." + localMAM.split(".")[1];
    }

    if (localMAM != "" && double.parse(localMAMV) < double.parse(serverMAM)) {
      print('need to update');
      showAlertDialog(context);
    } else {
      print('updated');
      var _duration = new Duration(seconds: 1);
      return new Timer(_duration, navigationPage);
    }
  }


  void navigationPage() async {
    database = await $FloorAppDatabase.databaseBuilder('mml.db').build();
    await Preference.containsKey("IsLoggedIn")
        ?
    {UtilMethods.navigationToNewPage(database,'/screens/HomeScreen',context)}
        : UtilMethods.navigationToNewPage(database,'/screens/LoginScreen',context);
  }

  showAlertDialog(BuildContext context)
  {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // Create button
    Widget updateButton = FlatButton(
        onPressed: () {
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

  getLoginData() async
  {

    List<InputConvertExitObjects> listLocal = new List<InputConvertExitObjects>();
    var getLogin = new List.from([
      new InputObject(TY: 1, PC: 0, CL: 1239, TI: 3, UI: true),
      new InputObject(TY: 1, PC: 0, CL: 1136, TI: 29, UI: true)
    ]);

    var bodyGetLogin = jsonEncode(<String, dynamic>{
      'AspNetUserID': await Preference.getItem("userID"),
      'RequestKeys': jsonEncode(getLogin),
      'IsMobile': true
    });

    //Navigator.of(context).pushReplacementNamed("/screens/HomeScreen");
    Map<dynamic, dynamic> userDetailsmap = await ApiBaseHelper()
        .post(APIConstants.GET_LOGIN_DETAILS, bodyGetLogin, context);
    var localMAM = await Preference.getItem("MAM_VER");

    var userDetails = ResponseBody.fromJson(userDetailsmap);




    versionCheck(userDetails.jsonOutput_StandardHeader.VER, localMAM);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      if (await Preference.containsKey("IsLoggedIn")) {
        getLoginData();
      }else{
        navigationPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key:_scaffoldKey,
      body: new Container(
          child: new Image(
        image: AssetImage('assets/images/introScreen.jpg'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      )),
    );
  }
}
