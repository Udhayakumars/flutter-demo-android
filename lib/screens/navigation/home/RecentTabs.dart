import 'dart:async';
import 'dart:convert';

import 'package:MMLMobile/customwidgets/ConfigImageViewFuture.dart';
import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_12_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_1_10_2.dart';
import 'package:MMLMobile/databasemodels/WebAppClientDataKeys.dart';
import 'package:MMLMobile/models/InputConvertExitObjects.dart';
import 'package:MMLMobile/models/InputObject.dart';
import 'package:MMLMobile/models/ResponseBody.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/Rkeys.dart';
import 'package:MMLMobile/models/RowItem.dart';
import 'package:MMLMobile/models/RowSources.dart';
import 'package:MMLMobile/models/recents/PI_30_PRI_127_PRCI_656_Items.dart';
import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:global_configuration/global_configuration.dart';
import 'package:global_state/gs.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:toast/toast.dart';

class RecentTabScreen extends StatefulWidgetGS {
  // final ResponseBody recents;
  // final int backPI;
  // final int backPRI;

  const RecentTabScreen({Key key}) : super(key: key);

  @override
  _RecentTabScreenState createState() => _RecentTabScreenState();
}

// Future<void> ErrorCall(context, message, listLocal, {jsonError}) async {
//   var body = jsonEncode(<String, dynamic>{
//     'CrmUserID': await Preference.getItem("userID"),
//     'MmlAccountID': await Preference.getItem("MmlAccountID"),
//     'WebAppSessionID': await Preference.getItem("WebAppSessionID"),
//     'ActiveDataKeys': jsonEncode(listLocal).toString(),
//     "EventID": 203,
//     "ErrorCode": 623,
//     "Error": message,
//   });
//   await ApiBaseHelper().post(APIConstants.SEND_ERROR_CODE, body, context);
// }

getSAS_token() async {
  await Preference.getItem("SAS_Token")
      .then((value) => {APIConstants.sasToken = value});
}

class _RecentTabScreenState extends State<RecentTabScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  RowSources_RS_1_10_2 _rowItem;
  AppDatabase appDatabase;
  int recentPagePI = 30;
  int recentPagePRI = 127;

  List<PI_30_PRI_127_PRCI_656_Items> _pi_30_PRI_127_PRCI_656_Items = [];
  Timer timer;

  //String sasToken;

  @override
  void initState() {
    setState(() {
      GlobalState.pageDataLoaded = false;
      APIConstants.rowSource_RS_12_2 = APIConstants.rowSource_RS_12_2 ?? [];
      APIConstants.rowSource_RS_29_41_15_6 =
          APIConstants.rowSource_RS_29_41_15_6 ?? [];
      APIConstants.rowSource_RS_1_10_2 = APIConstants.rowSource_RS_1_10_2 ?? [];
    });

    super.initState();
    // GlobalState.initContext = context;

    builder();
    // loadPageData();
  }

  @override
  void deactivate() {
    if (timer != null) {
      timer.cancel();
    }
    super.deactivate();
    // GlobalState.disposeContext = context;
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
    // GlobalState.disposeContext = context;
  }

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
    await getSAS_token();
  }

  Future<Null> _refresh() async {
    //Holding pull to refresh loader widget for 2 sec.
    //You can fetch data from server.
    print('refreshing ...');

    // UtilMethods.bef
    await UtilMethods.eventRefresh(appDatabase, context);

    await new Future.delayed(const Duration(seconds: 2));

    setState(() {});

    return null;
  }

  Widget _myListView() {
    return ListView.builder(
      itemCount: _pi_30_PRI_127_PRCI_656_Items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = _pi_30_PRI_127_PRCI_656_Items[index];
        return Card(
          child: ListTile(
            leading: GlobalConfiguration().get(item.IRA.toString()) != null
                ? Image.asset(
                    GlobalConfiguration().get(item.IRA.toString()),
                    height: 30,
                    width: 30,
                  )
                : null,
            title: Text(
              item.LA,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            subtitle: Text(
              item.S1,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
            onTap: () {
              UtilMethods.navigationToNewPage(appDatabase,
                  GlobalConfiguration().get(item.PI.toString()), context);
              UtilMethods.showToast(
                  "Should Navigate to " +
                      item.PI.toString() +
                      item.PRI.toString(),
                  context: context,
                  duration: Toast.LENGTH_LONG,
                  gravity: Toast.BOTTOM);
            },
            onLongPress: () {},
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _pi_30_PRI_127_PRCI_656_Items = APIConstants.pi_30_PRI_127_PRCI_656_Items;

    print("PI_30_127_Values");
    print(_pi_30_PRI_127_PRCI_656_Items.toString());

    return new Scaffold(
        key: _scaffoldKey,
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
              child: _pi_30_PRI_127_PRCI_656_Items.length == 0
                  ? Text("")
                  : new Column(
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                              APIConstants.pi_30_PRI_127_PRCI_711_RefreshTime,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(child: _myListView()),

                        // new Expanded(
                        //   flex: 3,
                        //   child: new ConfigImageViewFuture(
                        //       configValue: APIConstants.pi_30_PRI_127_PRCI_680_Text.DT['Text']),
                        // ),
                        // new Expanded(
                        //   flex: 3,
                        //   child: FadeInImage(
                        //       placeholder:
                        //           AssetImage(GlobalConfiguration().get("1603")),
                        //       fit: BoxFit.cover,
                        //       height: 100.0,
                        //       //image: imageURL,
                        //       imageErrorBuilder: (BuildContext context,
                        //           Object exception, StackTrace stackTrace) {
                        //
                        //         // UtilMethods.ErrorCall(appDatabase,
                        //         //     context, "Image Loading Error",623);
                        //         return Container(
                        //           width: 100.0,
                        //           height: 100.0,
                        //           child: Image.asset(
                        //               GlobalConfiguration().get("1603")),
                        //         );
                        //       },
                        //       image: APIConstants.pi_30_PRI_127_PRCI_679_Image.UPX == 1
                        //           ? AssetImage(UtilMethods.getUPXBasedImage(
                        //               appDatabase,
                        //               APIConstants.pi_30_PRI_127_PRCI_679_Image.DT['Text'] +
                        //                   APIConstants.sasToken,
                        //               APIConstants.pi_30_PRI_127_PRCI_679_Image.UPX))
                        //           : NetworkImage(UtilMethods.getURL(
                        //                   APIConstants.rowSource_RS_12_2.length > 0
                        //                       ? APIConstants.rowSource_RS_12_2
                        //                       : new List<RowSources_RS_12_2>(),
                        //                   APIConstants.pi_30_PRI_127_PRCI_679_Image.UPX) +
                        //               UtilMethods.getUPXBasedImage(
                        //                 appDatabase,
                        //                   APIConstants.pi_30_PRI_127_PRCI_679_Image.DT['Text'] +
                        //                       APIConstants.sasToken,
                        //                   APIConstants.pi_30_PRI_127_PRCI_679_Image.UPX))),
                        // ),
                        // new Expanded(
                        //   flex: 3,
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width * 100,
                        //     height: MediaQuery.of(context).size.height * 0,
                        //     padding: EdgeInsets.all(10.0),
                        //     child: new DropdownButton<RowSources_RS_1_10_2>(
                        //       isExpanded: true,
                        //       hint: new Text('RS_1_10_2'),
                        //       value: _rowItem == null ? null : _rowItem,
                        //       items: (APIConstants.rowSource_RS_1_10_2.length > 0
                        //               ? APIConstants.rowSource_RS_1_10_2
                        //               : new List<RowSources_RS_1_10_2>())
                        //           .map((dynamic value) {
                        //         return new DropdownMenuItem<RowSources_RS_1_10_2>(
                        //           value: value,
                        //           child: new Text(
                        //             value.D.toString(),
                        //             style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 13,
                        //               color: Colors.black,
                        //             ),
                        //           ),
                        //         );
                        //       }).toList(),
                        //       onChanged: (dynamic newValue) {
                        //         setState(() {
                        //           _rowItem = newValue;
                        //         });
                        //       },
                        //     ),
                        //   ),
                        // )
                      ],
                    )),
          if(GlobalState.apiLoading) PageDataLoader()
        ]));
  }
}
