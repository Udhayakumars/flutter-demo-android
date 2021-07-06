import 'dart:convert';
// import 'dart:html';

import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/screens/navigation/search/Search.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:global_state/gs.dart';

import '../lib/screens/home/Home.dart';
import '../lib/screens/organization/Organization.dart';

class NavigationCalls extends StatefulWidgetGS {
  // final int backPI;
  // final int backPRI;

  const NavigationCalls({Key key}) : super(key: key);
  @override
  _NavigationCallsState createState() => _NavigationCallsState();
}

class _NavigationCallsState extends State<NavigationCalls> {
  int _selectedIndex = 0;
  AppDatabase appDatabase;
  bool isLoading = false;

  List<Widget> _children = [
    HomeScreenNav(),
    Center(child: Icon(Icons.calendar_today)),
    SearchScreen(),
    Organization(),
    Center(child: Icon(Icons.notifications))
  ];

  @override
  void initState() {
    super.initState();
    builder();
  }

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  int getSelectedIndex(int PI) {
    switch (PI) {
      case 30:
        {
          //Home tab
          return 0;
        }
        break;
      case 31:
        {
          //calender tab
          return 1;
        }
        break;
      case 32:
        {
          //search tab
          return 2;
        }
        break;
      case 33:
        {
          //organization tab
          return 3;
        }
        break;
      default:
        return 0;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    //check the globalstate pi and pri if pi and pri change means we update the selectedIndex
    _selectedIndex = getSelectedIndex(GlobalState.PI);

    return Scaffold(
      body: Stack(children: [
        Opacity(
            opacity: isLoading ? 0.1 : 1.0,
            child: AbsorbPointer(
                absorbing: isLoading, child: _children[_selectedIndex])),
        Center(
            child: Opacity(
              opacity: isLoading ? 1.0 : 0,
              child: Center(child: CircularProgressIndicator()),
            ))
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        iconSize: 10,
        elevation: 5,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: _selectedIndex == 0
                ? Image.asset(
              GlobalConfiguration().get("1117"),
              height: 28,
              width: 28,
            )
                : Image.asset(
              GlobalConfiguration().get("1101"),
              height: 28,
              width: 28,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: _selectedIndex == 1
                  ? Image.asset(
                GlobalConfiguration().get("1611"),
                height: 28,
                width: 28,
              )
                  : Image.asset(
                GlobalConfiguration().get("1343"),
                height: 28,
                width: 28,
              ),
              label: 'Calendar'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: _selectedIndex == 2
                  ? Image.asset(
                GlobalConfiguration().get("1619"),
                height: 28,
                width: 28,
              )
                  : Image.asset(
                GlobalConfiguration().get("1041"),
                height: 28,
                width: 28,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: _selectedIndex == 3
                  ? Image.asset(
                GlobalConfiguration().get("1627"),
                height: 28,
                width: 28,
              )
                  : Image.asset(
                GlobalConfiguration().get("1375"),
                height: 28,
                width: 28,
              ),
              label: 'Organization'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: _selectedIndex == 4
                  ? Image.asset(
                GlobalConfiguration().get("1636"),
                height: 28,
                width: 28,
              )
                  : Image.asset(
                GlobalConfiguration().get("1359"),
                height: 28,
                width: 28,
              ),
              label: 'Notification'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) async {
          onTabTapped(index);
        },
      ),
    );
  }

  void onTabTapped(int index) async {
    print("==================================================");
    print("====================== ON TAB CLICKED================");
    print("=======================================================");

    switch (index) {
      case 0:
        UtilMethods.eventPageRegionChange(appDatabase, context, 723, 2,null);
        break;
      case 1:
      // do something else
        UtilMethods.eventPageRegionChange(appDatabase, context, 724,2,null);
        break;
      case 2:
      // do something else
        UtilMethods.eventPageRegionChange(appDatabase, context, 725,2,null);
        break;
      case 3:
      // do something else
        UtilMethods.eventPageRegionChange(appDatabase, context, 726,211,null);
    }

    setState(() {
      _selectedIndex = index;
    });
  }
}
