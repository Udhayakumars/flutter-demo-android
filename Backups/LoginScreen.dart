import 'dart:convert';

import 'package:MMLMobile/database/AppDatabase.dart';

import 'package:MMLMobile/databasedaos/RowSourcesDao.dart';
import 'package:MMLMobile/databasedaos/StandardHeaderModelDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientDataKeyDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientDataDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysCacheDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysFromSqlDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysActiveDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysRequestKeysDao.dart';
import 'package:MMLMobile/databasemodels/WebAppClientData.dart'
    as webAppClientData;
import 'package:MMLMobile/databasemodels/WebAppClientData.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysActive.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysPageTab.dart';
import 'package:MMLMobile/models/InputObject.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/PIandPRI.dart';
import 'package:MMLMobile/models/PageDirectionObject.dart';
import 'package:MMLMobile/models/ResponseBody.dart';
import 'package:MMLMobile/models/RowItem.dart';
import 'package:MMLMobile/models/UserLogin.dart';
import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:catcher/core/catcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_configuration/global_configuration.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;

import 'ForgotPasswordScreen.dart';

class LoginScreenV extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenV> {
  final _formKey = GlobalKey<FormState>();
  AppDatabase appDatabase;
  WebAppClientDataKeyDao webAppClientDataKeyDao;
  WebAppClientDataDao webAppClientDataDao;
  RowSourcesDao rowSourcesDao;
 
  StandardHeaderModelDao standardHeaderModelDao;

  WebAppClientKeysRequestKeysDao webAppClientKeysRequestKeysDao;
  WebAppClientKeysFromSqlDao webAppClientKeysFromSqlDao;

  WebAppClientKeysActiveDao webAppClientKeysActiveDao;
  WebAppClientKeysCacheDao webAppClientKeysCacheDao;
  bool _isLoading = false;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(),
          preferredSize: Size(0.0, 0.0),
        ),
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Opacity(
              opacity: _isLoading ? 0.1 : 1.0,
              child: AbsorbPointer(
                  absorbing: _isLoading,
                  child: ListView(shrinkWrap: true, children: <Widget>[
                    Column(children: <Widget>[
                      logoStyle(),
                      Center(
                          child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [loginDesign()],
                                ),
                              ))),
                    ]),
                  ]))),
          Center(
              child: Opacity(
            opacity: _isLoading ? 1.0 : 0,
            child: Center(child: CircularProgressIndicator()),
          ))
        ]));
  }

  Widget logoStyle() {
    return new Align(
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(-100.0)),
        child: Image.asset(
          'assets/images/CurvePics.jpg',
          width: double.infinity,
          height: 240,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  generateError() async {
    Catcher.sendTestException();
  }

  setRecents() async {
    int recentPagePI = 30;
    int recentPagePRI = 127;
    final cacheData = await Preference.getItem(recentPagePI.toString() +
        '_' +
        recentPagePRI.toString() +
        "_jsonOutput_WebAppClientData");
    if (cacheData != null && cacheData != "") {
      APIConstants.recentItems.clear();
      var list = jsonDecode(cacheData);
      // print(list);

      List<dynamic> valueJSON = (list['jDT'] as List)
          .map((e) => NavigationObject.fromJson(e))
          .toList();

      try {
        webAppClientDataDao.deleteAllWebAppClientData();
      } catch (e) {
        print(e);
      }

      for (NavigationObject value in valueJSON) {
        int id = await webAppClientDataDao.insertWebAppClientData(
            new webAppClientData.WebAppClientData.fromJson(value.toJson()));
        //Insert Data
        WebAppClientData webClientDataLocal =
            await webAppClientDataDao.findWebAppClientDataById(id);

        if (value.DT != null && !value.DT.toString().contains('Text')) {
          for (Map<String, dynamic> pageValue in value.DT) {
            PageDirectionObject pageValueD =
                PageDirectionObject.fromJson(pageValue);
            APIConstants.recentItems.add(pageValueD);
          }
        } else if (value.DT != null && value.DT.toString().contains('Text')) {
          var testID = value.DT['Text'];
          // print("testID == $testID");
          if (value.PRCI == 679) {
            APIConstants.recentItemsText = value;
          }
          if (value.PRCI == 680) {
            APIConstants.recentItemsImage = value;
          }
          if (value.PRCI == 711) {
            APIConstants.refreshTime = testID.toString();

            // print(APIConstants.refreshTime + "?..");
          }
        }
      }
    }
  }

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  Widget loginDesign() {
    return Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: new Align(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(6.0),
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
                    hintText: 'Enter your ID',
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
              new Padding(
                padding: EdgeInsets.only(top: 10, left: 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: _pass,
                obscureText: true,
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  hintText: '.......',
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
                keyboardType: TextInputType.visiblePassword,
                validator: (String value) {
                  if (value.isEmpty)
                    return 'Enter the Password';
                  else
                    return null;
                },
              ),
              Stack(alignment: Alignment.center, children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.77,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: FlatButton(
                      child: Image.asset(
                        'assets/images/login_btn.jpg',
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.fitWidth,
                      ),
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        UtilMethods.purgDB(appDatabase);

                        var body = jsonEncode(<String, String>{
                          'userName': "dtalken@meqlib.com",
                          'Password': "Robbie69!",
                        });

                        print(body);
                        print("=================Body==============");

                        Map<dynamic, dynamic> userMap = await ApiBaseHelper()
                            .post(APIConstants.BASE_LOGIN, body, context);
                        var user = UserLogin.fromJson(userMap);
                        print(user.UserID);

                        if (user.UserID != null) {
                          Preference.setItem("IsLoggedIn", user.access_token);
                          Preference.setItem("userID", user.UserID.toString());

                          var getLogin = new List.from([
                            new InputObject(
                                TY: 1, PC: 0, CL: 1239, TI: 3, UI: true),
                            new InputObject(
                                TY: 1, PC: 0, CL: 1136, TI: 29, UI: true)
                          ]);

                          webAppClientKeysActiveDao
                              .deleteAllWebAppClientDataKeys();
                          List<WebAppClientKeysActive> getLoginDB =
                              new List.from([
                            new WebAppClientKeysActive(
                                TY: 1, PC: 0, CL: 1239, TI: 3, UI: 1),
                            new WebAppClientKeysActive(
                                TY: 1, PC: 0, CL: 1136, TI: 29, UI: 1)
                          ]);
                          //LOGIN
                          webAppClientKeysActiveDao
                              .insertWebClientDataList(getLoginDB);

                          appDatabase.webAppClientKeysPageTab
                              .deleteAllWebAppClientDataKeys();
                          List<WebAppClientKeysPageTab> setLoginPageTab =
                              new List.from([
                            new WebAppClientKeysPageTab(
                                TY: 4, PC: 0, CL: 1136, TI: 30, UI: 1),
                            new WebAppClientKeysPageTab(
                                TY: 4, PC: 717, CL: 2663, TI: 127, UI: 1)
                          ]);
                          appDatabase.webAppClientKeysPageTab
                              .insertWebClientDataList(setLoginPageTab);

                          var bodyGetLogin = jsonEncode(<String, dynamic>{
                            'AspNetUserID': user.UserID,
                            'RequestKeys': jsonEncode(getLogin),
                            'IsMobile': true
                          });
                          Map<dynamic, dynamic> userDetailsmap =
                              await ApiBaseHelper().post(
                                  APIConstants.GET_LOGIN_DETAILS,
                                  bodyGetLogin,
                                  context);

                          var userDetails =
                              ResponseBody.fromJson(userDetailsmap);

                          var ls = userDetails.jsonOutput_WebAppClientData[1]
                              as NavigationObject;

                          Preference.setItem(
                              ls.PI.toString() +
                                  "_" +
                                  ls.PRI.toString() +
                                  "_jsonOutput_WebAppClientData",
                              userDetailsmap['jsonOutput_WebAppClientData']
                                  .toString());

                          Preference.setItem(
                              "responseBody", jsonEncode(userDetailsmap));

                          Preference.setItem(
                              "MmlAccountID",
                              userDetails.jsonOutput_CustomHeader.ML_AC_ID
                                  .toString());
                          Preference.setItem(
                              "WebAppSessionID",
                              userDetails.jsonOutput_CustomHeader.SN_ID
                                  .toString());
                          Preference.setItem("userID", user.UserID.toString());
                          Preference.setItem("MAM_VER",
                              userDetails.jsonOutput_StandardHeader.VER);
                          final valueOfPIandPRI = PIandPRI(
                            PI:ls.PI,
                            PRI:ls.PRI
                          ); 
                          await UtilMethods.eventRowSourcesInsert(appDatabase, userDetails.jsonOutput_RowSources);
                          await UtilMethods.setRecentsPageItems(appDatabase, valueOfPIandPRI, userDetails.jsonOutput_WebAppClientData);
                          await UtilMethods.afterSQL(appDatabase);
                          var sasToken = await ApiBaseHelper()
                              .get(APIConstants.GET_SAS_TOKEN + "devopt");
                          APIConstants.sasToken = sasToken;
                          Preference.setItem("SAS_Token", sasToken.toString());
                          setState(() {
                            _isLoading = false;
                          });
                          GlobalState.PI = ls.PI;
                          GlobalState.PRI = ls.PRI;
                          Navigator.of(context).pushReplacementNamed(
                              GlobalConfiguration().get(ls.PI.toString()));
                        } else {}
                      },
                    )),
                Text(
                  "Login",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ]),
              GestureDetector(
                  child: new Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () async {
                    //generateError();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ForgotPassword()));
                  }),
              Column(
                children: [
                  Padding(padding: EdgeInsets.all(30)),
                  Text(
                    'Signing up for a new account is available at:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'WWW.myqlib.com',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();

    //appDatabase.database.rawQuery("");

    setState(() {
      webAppClientDataKeyDao = appDatabase.webAppClientDataKeys;
      webAppClientDataDao = appDatabase.navigationObject;
      rowSourcesDao = appDatabase.rowSourcesValues;
      standardHeaderModelDao = appDatabase.standardHeader;
      webAppClientKeysRequestKeysDao = appDatabase.webAppClientKeysRequestKeys;
      webAppClientKeysFromSqlDao = appDatabase.webAppClientKeysFromSql;
      webAppClientKeysActiveDao = appDatabase.webAppClientKeysActive;
      webAppClientKeysCacheDao = appDatabase.webAppClientKeysCache;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    builder();
  }
}
