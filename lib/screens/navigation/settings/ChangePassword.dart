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
import 'package:MMLMobile/screens/navigation/NavigationCalls.dart';
import 'package:MMLMobile/screens/navigation/home/Settings.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:global_configuration/global_configuration.dart';
import 'package:toast/toast.dart';

class ChangePassword extends StatefulWidget {
  final ResponseBody recents;

  const ChangePassword({Key key, this.recents}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  RowItem _rowItem;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AppDatabase appDatabase;
  int changePasswordPagePI = 37;
  int changePasswordPagePRI = 137;
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
    // String s = ModalRoute.of(context).settings.arguments;
    // print(s);
    // print("************************************");
    return new Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
            leading: MELBackButton(database: appDatabase,PI:changePasswordPagePI),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Image.asset(
              'assets/images/home_logo.jpg',
              height: 130,
              width: 250,
            )),
        body: Stack(children: [
          ListView(children: <Widget>[
            Column(children: <Widget>[
              Center(child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return SafeArea(
                      child: forgotPassDesign(context),
                    );
                  } else {
                    return SafeArea(
                      child: forgotPassDesign(context),
                    );
                  }
                },
              )),
            ]),
          ]),
          if(GlobalState.apiLoading) PageDataLoader()
        ]));
  }

  TextEditingController _email = TextEditingController();

  Widget forgotPassDesign(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: new Align(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
              ),
              new Padding(
                padding: EdgeInsets.only(top: 10, left: 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    fillColor: Colors.black,
                    hintText: 'Enter your email ID',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    contentPadding: EdgeInsets.only(bottom: 11, top: 11),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  // ignore: missing_return
                  validator: (String args) {
                    var email = args;
                    bool emailValid;
                    emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email);

                    return emailValid
                        ? null
                        : 'Email cannot be blank/not valid';
                    // print(emailValid);
                  }),
              Padding(
                padding: EdgeInsets.all(6.0),
              ),
              Stack(alignment: Alignment.center, children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.77,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: FlatButton(
                    child: Image.asset(
                      'assets/images/login_btn.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                    onPressed: () {
                      //todo
                    },
                  ),
                ),
                Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ]),
              Padding(
                padding: EdgeInsets.all(24.0),
              ),
            ],
          ),
        ));
  }
}
