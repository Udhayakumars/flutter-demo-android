import 'package:MMLMobile/customwidgets/CustomDialog.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'dart:developer' as developer;
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;

class HomeScreen extends StatefulWidget {
  @override
  _HomeCalendarPageState createState() => _HomeCalendarPageState();
}

class _HomeCalendarPageState extends State<HomeScreen> {
  // CalendarController _controller;
AppDatabase database;
  @override
  void initState() {
    super.initState();
    // _controller = CalendarController();
    builder();
    // showDialogue();
  }


  builder()async{
    database = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }
  // void showDialogue()
  // {
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MML'),
      ),
      body: Text(""),
    );
  }
}