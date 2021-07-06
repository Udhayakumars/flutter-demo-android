import 'dart:convert';

import 'package:MMLMobile/customwidgets/TreeViewNodeWidget.dart';
import 'package:MMLMobile/customwidgets/TextViewFuture.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
// import 'package:MMLMobile/models/TreeNode.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/PageDirectionObject.dart';
import 'package:MMLMobile/screens/navigation/organization/OrganizationCore.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:global_state/gs.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'package:tree_view/tree_view.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'dart:async';

class OrganizationWorked extends StatefulWidgetGS {
  OrganizationWorked({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Organization createState() => _Organization();
}

class _Organization extends State<OrganizationWorked> {
  int organizationPagePI = 33;
  int organizationPagePRI = 130;

  String _refreshTime = "";
  bool apiError = false;

  dynamic treeViewNode = {};
  dynamic childTreeViewNode = {};

  dynamic treeText = {};
  dynamic childText = {};

  List<PageDirectionObject> _organizationItems = [];
  AppDatabase appDatabase;

  Timer timer;

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  @override
  void initState() {
    setState(() {
      GlobalState.pageDataLoaded = false;
      _organizationItems = APIConstants.organizationItems != null
          ? APIConstants.organizationItems
          : [];
      GlobalState.pageDataLoaded = true;
    });
    loadPageData();
    builder();
  }

  @override
  void deactivate() {
    if (timer != null) {
      timer.cancel();
    }
    super.deactivate();
  }

  loadPageData() async {
    timer = Timer.periodic(new Duration(seconds: 2), (timer) async {
      //print("====================organization items===================");
      //print(_organizationItems);
      GlobalState.pageDataLoaded = false;
      if (_organizationItems.length == 0) {
        await setOrganization();
        GlobalState.pageDataLoaded = true;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
  }

  // @override
  // void setState(fn) {
  //   if (mounted) {
  //     super.setState(fn);
  //   }
  // }

  Future<Null> _refresh() async {
    //Holding pull to refresh loader widget for 2 sec.
    //You can fetch data from server.
    //print('refreshing ...');

    // UtilMethods.bef
    UtilMethods.eventRefresh(appDatabase, context);

    //UtilMethods.getPIandPRI(database, PRCI, context);

    //TODO
    //LoginScreenV();

    //getRefreshData();

    // await new Future.delayed(const Duration(seconds: 2));

    await loadPageData();

    setState(() {});

    return null;
  }

  setOrganization() async {
    try {
      APIConstants.organizationItems.clear();
      final cacheData = await Preference.getItem(organizationPagePI.toString() +
          '_' +
          organizationPagePRI.toString() +
          "_jsonOutput_WebAppClientData");

      if (cacheData != "" && cacheData != null) {
        var list = jsonDecode(cacheData);
        //print(list);

        List<dynamic> valueJSON = (jsonDecode(cacheData)['jDT'] as List)
            .map((e) => NavigationObject.fromJson(e))
            .toList();

        for (NavigationObject value in valueJSON) {
          if (value.DT != null && !value.DT.toString().contains('Text')) {
            var DtValue = value.DT;
            // //print("page?? == $DtValue");
            for (Map<String, dynamic> pageValue in value.DT) {
              // //print("page == $pageValue");
              var pageValueD = PageDirectionObject.fromJson(pageValue);
              // //print("pagevalue == $pageValueD");
              APIConstants.organizationItems.add(pageValueD);
            }
          }
          if (value.PRCI == 714) {
            APIConstants.refreshTime = value.DT['Text'].toString();

            //print(APIConstants.refreshTime + "????");
          }
        }
        setState(() {
          GlobalState.pageDataLoaded = false;
          _organizationItems = APIConstants.organizationItems != null
              ? APIConstants.organizationItems
              : [];
          GlobalState.pageDataLoaded = true;
          apiError = APIConstants.organizationItems.length > 0 ? false : true;
        });
      }
    } catch (error) {
      setState(() {
        apiError = true;
      });
    }
  }

  // List<TreeNode> treeNodeList = [];
  _getTreeNodeList() {
    List<TreeNode> treeNodeList = [];
    for (PageDirectionObject item in _organizationItems) {
      if (item.LV == 1) {
        treeNodeList.add(TreeNode(
            TI: item.TI,
            name: item.LA,
            iconID: item.IA,
            PGP: item.PGP,
            RR: item.RR,
            LF: item.LF,
            LV: item.LV,
            nodeRequestKeys: item.NK,
            childData: _getChildData(item)));
      }
    }
    return treeNodeList;
  }

  _getChildData(item) {
    return [
      for (PageDirectionObject child in _organizationItems)
        if (child.LV == item.LV + 1 && child.PTI == item.TI)
          TreeNode(
              TI: child.TI,
              name: child.LA,
              iconID: child.IA,
              RR: child.RR,
              LF: child.LF,
              PGP: child.PGP,
              LV: child.LV,
              nodeRequestKeys: child.NK,
              childData: _getChildData(child))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Organization',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
          ),
        ),
        body: Stack(children: [
          Visibility(
            child: Text(GlobalState.pageDataLoaded.toString()),
            visible: false,
          ),
          LiquidPullToRefresh(
              borderWidth: 1,
              height: 50,
              animSpeedFactor: 6,
              color: Colors.white,
              backgroundColor: Colors.blueAccent,
              springAnimationDurationInMilliseconds: 500,
              onRefresh: _refresh,
              showChildOpacityTransition: false,
              child: _organizationItems.length == 0
                  ? Center(child: CircularProgressIndicator())
                  : Column(children: [
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(APIConstants.refreshTime,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))),
                      Container(
                          // height: MediaQuery.of(context).size.height * 0.10,
                          child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: Card(
                                elevation: 0,
                                child: Center(
                                    child: Image.asset(
                                  GlobalConfiguration().get("1700"),
                                  height: 28,
                                  width: 28,
                                )),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: Card(
                                elevation: 0,
                                child: Center(
                                    child: Image.asset(
                                  GlobalConfiguration().get("1708"),
                                  height: 28,
                                  width: 28,
                                )),
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: TreeView(
                        hasScrollBar: true,
                        parentList: _getParentList(),
                      )),
                    ]))
        ]));
  }

  List<Parent> _getParentList() {
    List<Parent> parentList = [];
    _getTreeNodeList().forEach((treeNode) {
      Parent parent = _getParent(childNote: treeNode);
      parentList.add(parent);
    });
    return parentList;
  }

  Parent _getParent({@required TreeNode childNote}) {
    ChildList childList = _getChildList(treeNode: childNote);
    return Parent(
        parent: Card(
          child: ListTile(
            tileColor: Colors.grey[200],
            leading: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(
                  icon: Image.asset(
                    GlobalConfiguration().get("0023"),
                  ),
                  onPressed: null),
              IconButton(
                icon: Image.asset(
                  GlobalConfiguration().get("0002"),
                  height: 28,
                  width: 28,
                ),
                onPressed: null,
              )
            ]),
            title: Text(childNote.name),
            // subtitle: lastModifiedWidget,
            trailing: childNote.PGP != null
                ? IconButton(
                    icon: Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.grey,
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrganizationCore()),
                      );
                      //  await UtilMethods.eventPageRegionChange(appDatabase, context, childNote.PGP);
                    },
                  )
                : null,
          ),
        ),
        childList: childList,
        callback: (value) async {
          if (!value) {
            // final childNoteCache = await Preference.getItemList(childNote.TI);

            // if (childNoteCache.length > 0) {
            //   // List valueOfData = childNoteCache.map((i)=> jsonDecode(i)).toList();

            //   // List<PageDirectionObject> pageValue = valueOfData
            //   //     .map((e) => PageDirectionObject.fromJson(e))
            //   //     .toList();
            //   // setState(() {
            //   //   _organizationItems = _organizationItems + pageValue;
            //   // });
            // } else {
            final nodeItems = await UtilMethods.eventTreeviewNodeRefresh(
                appDatabase, context, childNote.nodeRequestKeys);
            List<PageDirectionObject> pageValue =
                nodeItems.map((e) => PageDirectionObject.fromJson(e)).toList();
            // List<PageDirectionObject> list = [];
            // for(int i=0; i <=5; i++){
            //     PageDirectionObject pageDirectionObject = PageDirectionObject(LA: "Test $i",PTI:childNote.TI,LV:childNote.LV + 1);
            //     list.add(pageDirectionObject);
            // }
            // List<TreeNode> treeNodes = pageValue
            //     .map((e) => TreeNode(
            //         TI: e.TI,
            //         name: e.LA,
            //         iconID: null,
            //         PGP: e.PGP,
            //         nodeRequestKeys: e.NK,
            //         childData: []))
            //     .toList();
            setState(() {
              GlobalState.pageDataLoaded = false;
              // for (int i = 1; i <= 1000; i++) {
                _organizationItems = _organizationItems + pageValue;
              // }
              GlobalState.pageDataLoaded = true;
            });
        
          }
        });
  }

  ChildList _getChildList({@required TreeNode treeNode}) {
    List<Widget> widgetList = [];

    List<TreeNode> childTreeNodes = treeNode.childData;
    childTreeNodes.forEach((childTreeNode) {
      widgetList.add(Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: _getParent(childNote: childTreeNode),
      ));
    });
    return ChildList(children: widgetList);
  }
}
