import 'dart:convert';
import 'dart:io';

import 'package:MMLMobile/models/ExitObjects.dart';
import 'package:MMLMobile/models/InputObject.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/ResponseBody.dart';
import 'package:MMLMobile/models/Rkeys.dart';
import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/screens/navigation/calendar/CalendarTabs.dart';
// import 'package:MMLMobile/screens/navigation/calendar/TreeViewTabs.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;

class CalendarScreenNav extends StatefulWidget {
  @override
  _CalendarScreenNavState createState() => _CalendarScreenNavState();
}

class _CalendarScreenNavState extends State<CalendarScreenNav>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: _widgets.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> _widgets = [
    CalendarTabs(),
    Icon(Icons.settings),
    // TreeViewTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Calendar',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
        ),
        actions: <Widget>[
          button()
        ],
        bottom: TabBar(
          labelPadding: EdgeInsets.all(2),
          indicatorColor: Colors.yellow,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.yellow,
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2.0,
          indicatorPadding: EdgeInsets.only(left: 2.0, right: 2.0),
          isScrollable: false,
          physics: ScrollPhysics(),
          tabs: [
            Tab(text: 'Calendar'),
            Tab(text: 'Progress'),
            Tab(text: 'Treeview'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CalendarTabs(),
          Icon(Icons.timeline),
          // TreeViewTab()
        ],
      ),
    );
  }
  Widget button(){
    return IconButton(
      icon: Image.asset('assets/images/filter_blue.png',width: 24,height: 24,),
      onPressed: () async {

        Preference.removeKey("IsLoggedIn");
        Preference.removeKey("jsonOutput_WebAppClientData");
        Navigator.of(context).pushReplacementNamed(
            '/screens/SplashScreen');


        var getLogout = new List.from([
          new Rkeys(
              P:0,C:1239,I:1,U:true),
          new Rkeys(
               P:0,C:1136,I:3,U:true)
        ]);

        var body = jsonEncode(<String, dynamic>{
          'CrmUserID': await Preference.getItem("userId"),
          'MmlAccountID': await Preference.getItem("MmlAccountID"),
          'WebAppSessionID' : await Preference.getItem("WebAppSessionID"),
          'ActiveDataKeys': jsonEncode(getLogout),
        });

        //Robbie69!

        // {"CrmUserID":10,
        // "MmlAccountID": 10,
        // "WebAppSessionID" : 44,
        // "ActiveDataKeys" : "[{'P':0,'C':1239,'I':1,'U':true},{'P':0,'C':1136,'I':3,'U':true}]"}


        Map<dynamic, dynamic> userMap = await ApiBaseHelper().post(APIConstants.GET_LOGOUT_DETAILS, body, context);


        // do something
      },
    );
  }
}

