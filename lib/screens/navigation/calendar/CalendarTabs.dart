import 'package:MMLMobile/customwidgets/CustomDialog.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'dart:developer' as developer;

import 'package:timelines/timelines.dart';

class CalendarTabs extends StatefulWidget {
  @override
  _CalendarScreenNavPageState createState() => _CalendarScreenNavPageState();
}

class _CalendarScreenNavPageState extends State<CalendarTabs> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    // showDialogue();
  }

  // void showDialogue()
  // {
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TableCalendar(
            initialCalendarFormat: CalendarFormat.month,
            calendarStyle: CalendarStyle(
                todayColor: Colors.blueAccent,
                weekendStyle: TextStyle(
                  color: Colors.black,
                ),
                outsideWeekendStyle: TextStyle(
                  color: Colors.grey,
                ),
                holidayStyle: TextStyle(
                  color: Colors.black,
                ),
                selectedColor: Theme
                    .of(context)
                    .primaryColor,
                todayStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                    color: Colors.white)
            ),
            headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonShowsNext: false,
                decoration: BoxDecoration(
                    color: Colors.white
                )
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            builders: CalendarBuilders(
              selectedDayBuilder: (context, date, events) =>
                  Container(
                      margin: const EdgeInsets.all(6.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          borderRadius: BorderRadius.circular(24.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
              todayDayBuilder: (context, date, events) =>
                  Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(24.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.black),
                      )),
            ),
            calendarController: _controller,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),),
            child:  SizedBox(
              height: 200,
              child: Container(
                color: Colors.yellow,
                width: MediaQuery.of(context).size.width * 0.77,
                height: MediaQuery.of(context).size.height * 0.15,
                child:  Timeline.tileBuilder(
                  builder: TimelineTileBuilder.fromStyle(
                    contentsAlign: ContentsAlign.basic,
                    indicatorStyle: IndicatorStyle.outlined,
                    connectorStyle: ConnectorStyle.dashedLine,
                    contentsBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Timeline Event $index'),
                    ),
                    itemCount: 7,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}