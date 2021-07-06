import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysFromSqlDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysRequestKeysDao.dart';
import 'package:MMLMobile/models/InputObject.dart';
import 'package:MMLMobile/screens/navigation/home/RecentTabs.dart';
import 'package:MMLMobile/screens/navigation/home/Settings.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_state/gs.dart';

class HomeScreenNav extends StatefulWidgetGS {
  final int backPI;
  final int backPRI;
  const HomeScreenNav({Key key, this.backPI, this.backPRI}) : super(key: key);
  @override
  _HomeScreenNavState createState() => _HomeScreenNavState();
}

class _HomeScreenNavState extends State<HomeScreenNav>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  AppDatabase appDatabase;

  @override
  void initState() {
    // _tabController = new TabController(length: _childrens.length, vsync: this);

    builder();
    super.initState();

    // GlobalState.initContext = context;
  }

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
    _tabController = new TabController(length: 3, vsync: this);
    if (GlobalState.PRI != null) {
      final index = getTabIndex(GlobalState.PRI);
      if (index != null) {
        setState(() {
          _tabController.index = index;
        });
      }
    }
  }

  int getTabIndex(int PRI) {
    switch (PRI) {
      case 127:
        {
          //Home tab
          return 0;
        }
        break;
      case 187:
        {
          //settings tab
          return 1;
        }
        break;
      case 188:
        {
          //organization tab
          return 2;
        }
        break;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    // GlobalState.disposeContext = context;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _childrens = [
      RecentTabScreen(),
      SettingsTabScreen(),
      Icon(Icons.message_outlined),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _tabController != null
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Image.asset(
                'assets/images/home_logo.jpg',
                height: 130,
                width: 250,
              ),
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
                  Tab(text: 'Recent'),
                  Tab(text: 'Settings'),
                  Tab(text: 'Messages'),
                ],
                onTap: onTabTapped,
              ))
          : AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Image.asset(
                'assets/images/home_logo.jpg',
                height: 130,
                width: 250,
              )),
      body: Stack(children: [
        _tabController != null
            ? TabBarView(controller: _tabController, children: _childrens)
            : Text(""),
        // if(GlobalState.apiLoading) PageDataLoader()
      ]),
    );
  }

  void onTabTapped(int index) {
    switch (index) {
      case 0:
        UtilMethods.eventPageRegionChange(appDatabase, context, 728, 2, null);
        break;
      case 1:
        UtilMethods.eventPageRegionChange(appDatabase, context, 729, 2, null);
        // do something else
        break;
      case 2:
        UtilMethods.eventPageRegionChange(appDatabase, context, 730, 2, null);
        // do something else
        break;
    }
  }
}
