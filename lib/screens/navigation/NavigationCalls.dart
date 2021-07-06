import 'dart:convert';
// import 'dart:html';

import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
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
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'home/Home.dart';
import 'organization/Organization.dart';

class NavigationCalls extends StatefulWidgetGS {
  // final int backPI;
  // final int backPRI;
  final page;
  final int selectedIndex;

  const NavigationCalls({Key key, this.page, this.selectedIndex})
      : super(key: key);
  @override
  _NavigationCallsState createState() => _NavigationCallsState();
}

class _NavigationCallsState extends State<NavigationCalls> {
  int _selectedIndex = 0;
  AppDatabase appDatabase;
  bool isLoading = false;
  PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    if (widget.selectedIndex != null) {
      _selectedIndex = widget.selectedIndex;
      _controller.index = _selectedIndex;
    }
    super.initState();
    builder();
  }

  @override
  void dispose() {
    _controller = null;
    super.dispose();
  }

  @override
  void deactivate() {
    _controller = null;
    super.deactivate();
  }

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  List<Widget> childrens = [
    HomeScreenNav(),
    Center(child: Icon(Icons.calendar_today)),
    SearchScreen(),
    Organization(),
    Center(child: Icon(Icons.notifications))
  ];

  List<Widget> _buildScreens(selectedIndex) {
    List<Widget> copyWidget = [
      Center(child: Icon(Icons.calendar_today)),
      Center(child: Icon(Icons.calendar_today)),
      Center(child: Icon(Icons.calendar_today)),
      Center(child: Icon(Icons.calendar_today)),
      Center(child: Icon(Icons.calendar_today)),
    ];
    copyWidget[selectedIndex] =
        widget.page != null ? widget.page : childrens[selectedIndex];
    return copyWidget;
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: _controller.index == 0
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
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: _controller.index == 1
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
        title: ("Calender"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: _controller.index == 2
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
        title: ("Search"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: _controller.index == 3
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
        title: ("Organization"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: _controller.index == 4
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
        title: ("Notification"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
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
        return null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    //check the globalstate pi and pri if pi and pri change means we update the selectedIndex
    _controller.index = getSelectedIndex(GlobalState.PI) != null
        ? getSelectedIndex(GlobalState.PI)
        : _controller.index;

    return Stack(children: [
      PersistentTabView.custom(
        context,
        controller: _controller,
        itemCount: _navBarsItems()
            .length, // This is required in case of custom style! Pass the number of items for the nav bar.
        screens: _buildScreens(_controller.index),
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        hideNavigationBarWhenKeyboardShows: true,
        customWidget: CustomNavBarWidget(
          // Your custom widget goes here
          items: _navBarsItems(),
          selectedIndex: _controller.index,
          onItemSelected: (index) {
            if (!GlobalState.apiLoading) {
              setState(() {
                _controller.index =
                    index; // NOTE: THIS IS CRITICAL!! Don't miss it!
              });
              onTabTapped(index);
            }
          },
        ),
      )
      // PersistentTabView(
      //   context,
      //   controller: _controller,
      //   screens: _buildScreens(_controller.index),
      //   items: _navBarsItems(),
      //   selectedTabScreenContext: (context) {
      //     if (GlobalState.apiLoading) {
      //       return null;
      //     } else {
      //       return context;
      //     }
      //   },
      //   onItemSelected: (index) {
      //     onTabTapped(index);
      //   },
      //   confineInSafeArea: true,
      //   backgroundColor: Colors.white, // Default is Colors.white.
      //   resizeToAvoidBottomInset:
      //       true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      //   stateManagement: true, // Default is true.
      //   hideNavigationBarWhenKeyboardShows:
      //       true,
      //   hideNavigationBar: GlobalState.apiLoading,// Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      //   decoration: NavBarDecoration(
      //     borderRadius: BorderRadius.circular(10.0),
      //     colorBehindNavBar: Colors.white,
      //   ),
      //   popAllScreensOnTapOfSelectedTab: true,
      //   popActionScreens: PopActionScreensType.all,
      //   itemAnimationProperties: ItemAnimationProperties(
      //     // Navigation Bar's items animation properties.
      //     duration: Duration(milliseconds: 200),
      //     curve: Curves.ease,
      //   ),
      //   screenTransitionAnimation: ScreenTransitionAnimation(
      //     // Screen transition animation on change of selected tab.
      //     animateTabTransition: true,
      //     curve: Curves.ease,
      //     duration: Duration(milliseconds: 200),
      //   ),
      //   navBarStyle:
      //       NavBarStyle.style1, // Choose the nav bar style with this property.
      // ),
    ]);
  }

  void onTabTapped(int index) async {
    print("==================================================");
    print("====================== ON TAB CLICKED================");
    print("=======================================================");

    switch (index) {
      case 0:
        UtilMethods.eventPageRegionChange(appDatabase, context, 723, 2, null);
        break;
      case 1:
        // do something else
        UtilMethods.eventPageRegionChange(appDatabase, context, 724, 2, null);
        break;
      case 2:
        // do something else
        UtilMethods.eventPageRegionChange(appDatabase, context, 725, 2, null);
        break;
      case 3:
        // do something else
        UtilMethods.eventPageRegionChange(appDatabase, context, 726, 211, null);
    }

    setState(() {
      _controller.index = index;
    });
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    Key key,
    this.selectedIndex,
    @required this.items,
    this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeColorSecondary == null
                          ? item.activeColorPrimary
                          : item.activeColorSecondary)
                      : item.inactiveColorPrimary == null
                          ? item.activeColorPrimary
                          : item.inactiveColorPrimary),
              child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                item.title,
                style: TextStyle(
                    color: isSelected
                        ? (item.activeColorSecondary == null
                            ? item.activeColorPrimary
                            : item.activeColorSecondary)
                        : item.inactiveColorPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
