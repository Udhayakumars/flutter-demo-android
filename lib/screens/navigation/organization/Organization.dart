import 'dart:convert';
import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/databasedaos/RowSources_RS_30_2Dao.dart';
import 'package:MMLMobile/databasemodels/RowSources_30_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_1_10_2.dart';
import 'package:MMLMobile/models/RequestKeys.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/organization/PI_33_PRI_130_PRCI_688_Children.dart';
import 'package:MMLMobile/models/organization/PI_33_PRI_130_PRCI_688_Parent.dart';
import 'package:MMLMobile/models/organization/PI_33_PRI_130_PRCI_688_TreePath.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:global_state/gs.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/Preference.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'dart:async';
import 'top_sheet.dart';

class Organization extends StatefulWidgetGS {
  Organization({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Organization createState() => _Organization();
}

class _Organization extends State<Organization> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int organizationPagePI = 33;
  int organizationPagePRI = 130;
  AnimationController _controller;

  String _refreshTime = "";
  bool apiError = false;

  dynamic treeViewNode = {};
  dynamic childTreeViewNode = {};

  dynamic treeText = {};
  dynamic childText = {};

  List<PI_33_PRI_130_PRCI_688_Children> _pi_33_PRI_130_PRCI_688_Children = [];

  PI_33_PRI_130_PRCI_688_Parent _pi_33_PRI_130_PRCI_688_Parent;

  AppDatabase appDatabase;

  Timer timer;

  Animation<Offset> _offsetAnimation;

  bool nodeClick = false;
  List<PI_33_PRI_130_PRCI_688_TreePath> treePath;

  List<RowSources_RS_30_2> rowSource_30_2 = [];

  int selectSortID = null;

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  @override
  void initState() {
    super.initState();
    // GlobalState.initContext = context;

    setState(() {
      setState(() {
        _pi_33_PRI_130_PRCI_688_Children =
            APIConstants.pi_33_PRI_130_PRCI_688_Children;
        _pi_33_PRI_130_PRCI_688_Parent =
            APIConstants.pi_33_PRI_130_PRCI_688_Parent;
        treePath = APIConstants.pi_33_PRI_130_PRCI_688_TreePath;
      });
    });
    loadPageData();
    builder();
  }

  animationCall(int animationType) {
    setState(() {
      _controller = AnimationController(
          duration: const Duration(seconds: 2), vsync: this);
      _controller.forward();
      if (animationType == -1) {
        _offsetAnimation =
            Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -2.0))
                .animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.fastLinearToSlowEaseIn,
        ));
      } else {
        _offsetAnimation =
            Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 2.0)).animate(
                CurvedAnimation(
                    parent: _controller, curve: Curves.fastLinearToSlowEaseIn));
      }
    });
  }

  animationreset() {
    setState(() {
      _controller = AnimationController(
          duration: const Duration(seconds: 10), vsync: this)
        ..reset();
      _offsetAnimation = Tween<Offset>(
        begin: const Offset(-0.5, 0.0),
        end: const Offset(2, 0.0),
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.linearToEaseOut,
      ));
    });
  }

  @override
  void deactivate() {
    // //if page deactivate last organization items store an APIContstants.pi_33_PRI_130_PRCI_688_Children
    // APIConstants.pi_33_PRI_130_PRCI_688_Children = _pi_33_PRI_130_PRCI_688_Children;

    if (timer != null) {
      timer.cancel();
    }

    APIConstants.pi_33_PRI_130_PRCI_688_Children =
        _pi_33_PRI_130_PRCI_688_Children;
    APIConstants.pi_33_PRI_130_PRCI_688_Parent = _pi_33_PRI_130_PRCI_688_Parent;
    APIConstants.pi_33_PRI_130_PRCI_688_TreePath = treePath;
    super.deactivate();

    // GlobalState.disposeContext = context;
  }

  loadPageData() async {
    if (_pi_33_PRI_130_PRCI_688_Children.length == 0 &&
        _pi_33_PRI_130_PRCI_688_Parent == null) {
      timer = Timer.periodic(new Duration(seconds: 3), (timer) async {
        if (timer.tick == 5) {
          timer.cancel();
        }
        if (APIConstants.pi_33_PRI_130_PRCI_688_Children.length != 0 &&
            APIConstants.pi_33_PRI_130_PRCI_688_Parent != null) {
          setState(() {
            _pi_33_PRI_130_PRCI_688_Children =
                APIConstants.pi_33_PRI_130_PRCI_688_Children;
            _pi_33_PRI_130_PRCI_688_Parent =
                APIConstants.pi_33_PRI_130_PRCI_688_Parent;
            treePath = APIConstants.pi_33_PRI_130_PRCI_688_TreePath;
          });
          timer.cancel();
        }
      });
    }
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }

    if (_controller != null) {
      _controller.dispose();
    }

    super.dispose();
    // GlobalState.disposeContext = context;
  }

  Future<Null> _refresh() async {
    // UtilMethods.bef
    UtilMethods.eventRefresh(appDatabase, context);

    // await loadPageData();

    setState(() {});

    // await setOrganization();

    return null;
  }

  setChildOrganization(preferenceKey) async {
    try {
      APIConstants.pi_33_PRI_130_PRCI_688_Children.clear();
      final cacheData = await Preference.getItem(preferenceKey);
      if (cacheData != "" && cacheData != null) {
        var pageValue = jsonDecode(cacheData);
        _pi_33_PRI_130_PRCI_688_Parent =
            PI_33_PRI_130_PRCI_688_Parent.fromJson(pageValue['PARENT'][0]);
        treePath = pageValue['TREEPATH'] != null
            ? (pageValue['TREEPATH'] as List)
                .map((e) => PI_33_PRI_130_PRCI_688_TreePath.fromJson(e))
                .toList()
            : null;
        for (Map<String, dynamic> childrenValue in pageValue['CHILDREN']) {
          var pageValueChild =
              PI_33_PRI_130_PRCI_688_Children.fromJson(childrenValue);
          APIConstants.pi_33_PRI_130_PRCI_688_Children.add(pageValueChild);
        }
      }
      setState(() {
        GlobalState.pageDataLoaded = false;
        _pi_33_PRI_130_PRCI_688_Children =
            APIConstants.pi_33_PRI_130_PRCI_688_Children != null
                ? APIConstants.pi_33_PRI_130_PRCI_688_Children
                : [];
        APIConstants.pi_33_PRI_130_PRCI_688_Parent =
            _pi_33_PRI_130_PRCI_688_Parent;
        APIConstants.pi_33_PRI_130_PRCI_688_TreePath = treePath;
        GlobalState.pageDataLoaded = true;
      });
    } catch (e) {
      throw e;
    }
  }

  bool isLoadingVertical = false;

  Future _loadMoreVertical() async {
    setState(() {
      isLoadingVertical = true;
    });

    if (await UtilMethods.getTreeviewNodePrci688More(appDatabase)) {
      final generateNodeKey = [
        RequestKeys(
            TY: 3,
            CL: 7822,
            PC: 755,
            UI: false,
            TI: _pi_33_PRI_130_PRCI_688_Parent.TIR)
      ];

      await UtilMethods.eventTreeviewNodePrci688More(
          appDatabase, context, generateNodeKey);

      print(_pi_33_PRI_130_PRCI_688_Children.length);
      if (APIConstants.pi_33_PRI_130_PRCI_688_Children != null) {
        _pi_33_PRI_130_PRCI_688_Children = _pi_33_PRI_130_PRCI_688_Children +
            APIConstants.pi_33_PRI_130_PRCI_688_Children;
      }
      print("overall");
      print(_pi_33_PRI_130_PRCI_688_Children.length);
    }

    setState(() {
      isLoadingVertical = false;
    });
  }

  List<Widget> loadTreePathData() {
    treePath.sort((a, b) => a.LV.compareTo(b.LV));
    double indent = 0;
    List<Widget> childrens = [];
    treePath.forEach((element) {
      childrens.add(Padding(
          padding: EdgeInsets.only(left: indent),
          child: InkWell(
              onTap: () async {
                print(element);
                Navigator.pop(context);

                await setNodeData(element.NK, true, -1);
              },
              child: Row(children: [
                IconButton(
                  iconSize: 15,
                  icon: Image.asset(
                    element.IRD != null
                        ? (GlobalConfiguration().get(element.IRD.toString()) !=
                                null
                            ? GlobalConfiguration().get(element.IRD.toString())
                            : GlobalConfiguration().get("1708"))
                        : GlobalConfiguration().get("1708"),
                    height: 15,
                    width: 15,
                  ),
                  onPressed: () async {},
                ),
                Expanded(
                    child: Text(
                  element.LA,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                if (childrens.length == 0)
                  IconButton(
                    iconSize: 25,
                    icon: Icon(Icons.close),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
              ]))));
      indent += 3;
    });
    return childrens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: displayFilter()),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 100,
          leading: Row(children: [
            Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Card(
                    elevation: 0,
                    child: Center(
                      child: GestureDetector(
                          child: Image.asset(
                            GlobalConfiguration().get("1700"),
                            height: 28,
                            width: 28,
                          ),
                          onTap: () async {
                            // popupTreeWidget(context);
                            await setNodeData(
                                [APIConstants.pi_33_PRI_130_PRCI_772_NodeKey],
                                true,
                                -1);
                            // await setRootUp(
                            //     APIConstants.organization_PRCI_772_NodeKey, -1);
                          }),
                    ))),
            Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Card(
                  elevation: 0,
                  child: Center(
                      child: GestureDetector(
                    child: Image.asset(
                      GlobalConfiguration().get("1708"),
                      height: 28,
                      width: 28,
                    ),
                    onTap: () async {
                      TopSheet.show(
                        context: context,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: loadTreePathData()),
                        direction: TopSheetDirection.TOP,
                      );
                    },
                  )),
                )),
          ]),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: Image.asset(
                  GlobalConfiguration().get("1716"),
                  height: 28,
                  width: 28,
                )),
          ],
          centerTitle: true,
          title: Text(
            'Organization',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
          ),
        ),
        body: nodeClick
            ? SlideTransition(position: _offsetAnimation, child: bodyWidget())
            : bodyWidget());
  }

  Widget bodyWidget() {
    print("organization called");
    print("overall organization items.....");
    print(_pi_33_PRI_130_PRCI_688_Children.length);
    return Stack(children: [
      Visibility(
        child: Text(GlobalState.pageDataLoaded.toString()),
        visible: false,
      ),

      // new Expanded(
      //     flex: 1,
      //     child: new Padding(
      //       padding: EdgeInsets.only(top: 10, bottom: 10),
      //       child: Text(APIConstants.pi_33_PRI_130_PRCI_714_RefreshTime,
      //           style: TextStyle(
      //               color: Colors.red,
      //               fontWeight: FontWeight.bold)),
      //     )),
      if(!GlobalState.apiLoading)
      _pi_33_PRI_130_PRCI_688_Children.length == 0
          ? Center(child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()]))
          : Column(children: [
              LiquidPullToRefresh(
                  borderWidth: 1,
                  height: 50,
                  animSpeedFactor: 6,
                  color: Colors.white,
                  backgroundColor: Colors.blueAccent,
                  springAnimationDurationInMilliseconds: 500,
                  onRefresh: _refresh,
                  showChildOpacityTransition: false,
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // ignore: null_aware_in_logical_operator
                        if (_pi_33_PRI_130_PRCI_688_Parent != null)
                          if (!_pi_33_PRI_130_PRCI_688_Parent.ROOT)
                            IconButton(
                              icon:
                                  Icon(Icons.arrow_upward, color: Colors.black),
                              onPressed: () async {
                                await setNodeData(
                                    _pi_33_PRI_130_PRCI_688_Parent.NK, true, 1);
                              },
                            ),
                        Expanded(
                            child: Center(
                                child: Text(
                                    "${_pi_33_PRI_130_PRCI_688_Parent != null ? _pi_33_PRI_130_PRCI_688_Parent.LA : ""}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)))),
                        if (_pi_33_PRI_130_PRCI_688_Parent != null)
                          if (_pi_33_PRI_130_PRCI_688_Parent.PGP != null)
                            IconButton(
                              icon: Icon(Icons.more_horiz_rounded,
                                  color: Colors.black),
                              onPressed: () async {
                                await UtilMethods.eventPageRegionChange(
                                    appDatabase,
                                    context,
                                    _pi_33_PRI_130_PRCI_688_Parent.PGP,
                                    2,
                                    _pi_33_PRI_130_PRCI_688_Parent.DK);
                              },
                            ),
                      ])),

              Expanded(
                  child: LazyLoadScrollView(
                      isLoading: isLoadingVertical,
                      scrollOffset: 100,
                      onEndOfPage: () => _loadMoreVertical(),
                      child: Scrollbar(
                          child: ListView(children: [
                        RefreshIndicator(
                            onRefresh: _refresh,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  _pi_33_PRI_130_PRCI_688_Children.length,
                              itemBuilder: (context, position) {
                                return _getTile(
                                    _pi_33_PRI_130_PRCI_688_Children[position]);
                              },
                            ))
                      ])))),

              // RefreshIndicator(
              //   onRefresh: _refresh,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount: _pi_33_PRI_130_PRCI_688_Children.length,
              //     itemBuilder: (context, position) {
              //       return _getTile(
              //           _pi_33_PRI_130_PRCI_688_Children[position]);
              //     },
              //   ),
              // )
              if (isLoadingVertical) CircularProgressIndicator()
            ]),
      Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: RaisedButton(
                    onPressed: () async {
                      final getRS_30_2 =
                          await UtilMethods.eventGetRowSourceRS_30_2(
                              appDatabase, true);
                      rowSource_30_2 = getRS_30_2;
                      rowSource_30_2
                          .sort((a, b) => a.intIndex1.compareTo(b.intIndex1));
                      for (RowSources_RS_30_2 rowSource in rowSource_30_2) {
                        if (rowSource.blnSelected) {
                          selectSortID = rowSource.intWebAppTreeviewSortID;
                        }
                      }

                      displayBottomSheet(context);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(GlobalConfiguration().get("1732"),
                              height: 15, width: 15),
                          Text('Sort', style: TextStyle(fontSize: 16))
                        ]),
                    color: Colors.grey[600],
                    textColor: Colors.white,
                    elevation: 1,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: RaisedButton(
                        onPressed: () {
                          _scaffoldKey.currentState.openEndDrawer();
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(GlobalConfiguration().get("1724"),
                                  height: 15, width: 15),
                              Text('Filter',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black))
                            ]),
                        color: Colors.white,
                        textColor: Colors.white,
                        elevation: 1,
                      ),
                    ))
              ]))),
      if(GlobalState.apiLoading) PageDataLoader()
    ]);
  }

  _getTile(PI_33_PRI_130_PRCI_688_Children item) {
    return Card(
      child: ListTile(
        tileColor: Colors.grey[200],
        leading: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              item.IRE != null
                  ? Image.asset(GlobalConfiguration().get(item.IRE.toString()),
                      height: 25, width: 25)
                  : SizedBox(
                      height: 25,
                      width: 25,
                    ),
              IconButton(
                icon: Image.asset(
                  item.IRD != null
                      ? (GlobalConfiguration().get(item.IRD.toString()) != null
                          ? GlobalConfiguration().get(item.IRD.toString())
                          : GlobalConfiguration().get("1708"))
                      : GlobalConfiguration().get("1708"),
                  height: 28,
                  width: 28,
                ),
                onPressed: () async {
                  // popupTreeWidget(context);
                  if (!item.LF) {
                    await setNodeData(item.NK, false, -1);
                  } else if (item.PGP != null) {
                    await UtilMethods.eventPageRegionChange(
                        appDatabase, context, item.PGP, 2, item.DK);
                  }
                },
              ),
            ]),
        title: GestureDetector(
          child: Text(item.LA != null ? item.LA : ""),
          onTap: () async {
            // popupTreeWidget(context);
            if (!item.LF) {
              await setNodeData(item.NK, false, -1);
            } else if (item.PGP != null) {
              await UtilMethods.eventPageRegionChange(
                  appDatabase, context, item.PGP, 2, item.DK);
            }
          },
        ),
        // subtitle: lastModifiedWidget,
        trailing: item.PGP != null
            ? IconButton(
                icon: Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.grey,
                ),
                onPressed: () async {
                  await UtilMethods.eventPageRegionChange(
                      appDatabase, context, item.PGP, 2, item.DK);
                  //  await UtilMethods.eventPageRegionChange(appDatabase, context, childNote.PGP);
                },
              )
            : null,
      ),
    );
  }

  Future<void> setNodeData(List<RequestKeys> nodeRequestKeys, bool isParent,
      int animationType) async {
    try {
      print("node request treepath");
      print(nodeRequestKeys);
      if (nodeRequestKeys != null && !isLoadingVertical) {
        setState(() {
          nodeClick = true;
        });
        animationCall(animationType);
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          _pi_33_PRI_130_PRCI_688_Children = [];
          _pi_33_PRI_130_PRCI_688_Parent = null;
          nodeClick = false;
        });
        animationreset();

        //DJT I was wrong about trying to have modes, PTIR values etc since we already have a nodeRequestKeys with each node
        //DJT - old await UtilMethods.eventPrci688NodeChange(appDatabase, mode, TIR);

        // This will use NK and AC_DK to determine if Preference is available, if not it will make API call
        // After API call it will load results into Preference and Limit Preference Cache
        // Thus, either way, this will return the key to the Preference to be used for building Widgets
        // nodeRequestKeys (SQL maps: Children = TIR, Parent = PTIR) - Thus this is ALWAYS the PTIR in table Prci688Stack

        final preferenceKey = await UtilMethods.eventPrci688NodeChange(
            appDatabase, context, nodeRequestKeys);

        // DJT - all below is old code
        //final preferenceKey = 'organization_PRCI_688_Children_' + TIR.toString();
        // final cacheTI = await Preference.getItem(preferenceKey);

        // if (cacheTI != "" && cacheTI != null) {
        //   await setChildOrganization(preferenceKey);
        // } else {
        //   await UtilMethods.eventTreeviewNodePrci688Refresh(
        //       appDatabase, context, item.NK);

        await setChildOrganization(preferenceKey);
        setState(() {
          _pi_33_PRI_130_PRCI_688_Children =
              APIConstants.pi_33_PRI_130_PRCI_688_Children != null
                  ? APIConstants.pi_33_PRI_130_PRCI_688_Children
                  : [];
          _pi_33_PRI_130_PRCI_688_Parent =
              APIConstants.pi_33_PRI_130_PRCI_688_Parent;
          treePath = APIConstants.pi_33_PRI_130_PRCI_688_TreePath;
        });

        // DJT - Cache on return from SQL
        //   await UtilMethods.eventTreeviewNodePrci688PushCacheKeys(
        //       appDatabase, _pi_33_PRI_130_PRCI_688_Parent?.TIR, _pi_33_PRI_130_PRCI_688_Parent?.CK);

        //   UtilMethods.purgeMaximumTreeView688CacheExceeded(appDatabase);
      }
    } catch (e) {
      UtilMethods.ErrorCall(appDatabase, context, e.toString(), 623);
    }
  }

  double _currentSliderValue = 20;

  Widget displayFilter() {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
          children: [
            Visibility(
              child: Text(GlobalState.pageDataLoaded.toString()),
              visible: false,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                child: Text(
                  'Filter',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                alignment: Alignment.topLeft,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Align(
                child: Text(
                  'Price Range',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                alignment: Alignment.topLeft,
              ),
            ),
            Card(
              child: Slider(
                value: _currentSliderValue,
                min: 0.0,
                max: 100.0,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Align(
                child: Text(
                  'Category',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                alignment: Alignment.topLeft,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Wrap(
                children: [
                  FittedBox(
                    child: SizedBox(
                      child: Card(
                          child: Center(
                        child: Text('All'),
                      )),
                    ),
                  ),
                  FittedBox(
                    child: SizedBox(
                      child: Card(
                          child: Center(
                        child: Text('Most Reviwed'),
                      )),
                    ),
                  ),
                  FittedBox(
                    child: SizedBox(
                      child: Card(
                          child: Center(
                        child: Text('Trending'),
                      )),
                    ),
                  ),
                  FittedBox(
                    child: SizedBox(
                      child: Card(
                          child: Center(
                        child: Text(' Offer'),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Align(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Submit'),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void displayBottomSheet(BuildContext context) {
    if (rowSource_30_2.length == 0) {
      return;
    }
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (ctx) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Wrap(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Align(
                        child: Text(
                          'SortBy',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Column(
                          children: rowSource_30_2
                              .map((data) => RadioListTile(
                                    title: Text("${data.strRowSource}"),
                                    groupValue: selectSortID,
                                    value: data.intWebAppTreeviewSortID,
                                    onChanged: (val) async {
                                      await UtilMethods.eventSelectedRS_30_2(
                                          appDatabase, val);
                                      setState(() {
                                        selectSortID = val;
                                      });
                                    },
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          child: Text('Submit'),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ));
          });
        });
  }
}
