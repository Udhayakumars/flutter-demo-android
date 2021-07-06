import 'dart:io';

import 'package:MMLMobile/customwidgets/BackButton.dart';
import 'package:MMLMobile/customwidgets/ExpandedText.dart';
import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/organization/PI_87_PRI_205_PRCI_817_Items.dart';
import 'package:MMLMobile/models/organization/PI_92_PRI_210_PRCI_787_Items.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;

import 'package:global_configuration/global_configuration.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_state/gs.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'dart:math' as math;

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SiteScreen extends StatefulWidgetGS {
  @override
  _SiteScreenState createState() => _SiteScreenState();
}

class _SiteScreenState extends State<SiteScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = PageController(viewportFraction: 0.8);

  AppDatabase appDatabase;
  int SitesPagePI = 87;
  int initialImageIndex;
  bool showDescriptionFull = false;

  Film_Strip_Children _current;
  @override
  void initState() {
    // imageCache.clear();
    // APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
    builder();
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  List imgList = [
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg"
  ];

  int childrenCount = 0;
  List<Widget> imageSliders = [];

  String sasToken = "";
  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
    final sasTokenPref = await Preference.getItem('SAS_Token');
    setState(() {
      sasToken = sasTokenPref;
    });
  }

  Future<Null> _refresh() async {
    // UtilMethods.bef
    UtilMethods.eventRefresh(appDatabase, context, eventID: 220);
    setState(() {});
    return null;
  }

  List<Widget> getImageList() {
    return APIConstants.pi_89_PRI_207_PRCI_785_Items[0].CHILDREN.map((item) {
      UtilMethods.evictImage("${item.URL_STRIP_VIEW + sasToken}");
      return Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  if (_current?.URL_STRIP_VIEW != null)
                    FadeInImage.assetNetwork(
                        image: _current?.URL_STRIP_VIEW + sasToken,
                        placeholder: GlobalConfiguration().get("-1"),
                        imageErrorBuilder: (c, v, b) {
                          return Image.asset(GlobalConfiguration().get("1603"));
                        })
                ],
              )),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final pi_87_PRI_205_PRCI_817_Items =
        APIConstants.pi_87_PRI_205_PRCI_817_Items.length > 0
            ? APIConstants.pi_87_PRI_205_PRCI_817_Items[0]
            : null;
    TvpCrmSitesDATA tvpSites_APP_DATA;
    List<JsonCrmAddressesDATA> jsonCrmAddresses;
    List<JsonCrmCommunicationsDATA> jsonCrmCommunications;
    if (pi_87_PRI_205_PRCI_817_Items != null) {
      if (pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA != null) {
        tvpSites_APP_DATA =
            pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA.length > 0
                ? pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA[0]
                : null;

        if (tvpSites_APP_DATA != null) {
          jsonCrmAddresses = tvpSites_APP_DATA.jsonCrmAddressesDATA;
          jsonCrmAddresses.sort((a, b) => a.intIndex1.compareTo(b.intIndex1));

          jsonCrmCommunications = tvpSites_APP_DATA.jsonCrmCommunicationsDATA;
          jsonCrmCommunications
              .sort((a, b) => a.intIndex1.compareTo(b.intIndex1));
        }
      }
    }

    if (_current == null &&
        APIConstants.pi_89_PRI_207_PRCI_785_Items.length > 0) {
      _current =
          APIConstants.pi_89_PRI_207_PRCI_785_Items[0].CHILDREN.length > 0
              ? APIConstants.pi_89_PRI_207_PRCI_785_Items[0].CHILDREN[0]
              : null;
      if (APIConstants
                  .pi_89_PRI_207_PRCI_785_Items[0].HEADER[0].INITIAL_INDEX1 !=
              null &&
          initialImageIndex == null) {
        setState(() {
          initialImageIndex = APIConstants
                  .pi_89_PRI_207_PRCI_785_Items[0].HEADER[0].INITIAL_INDEX1 -
              1;
          childrenCount = APIConstants
                  .pi_89_PRI_207_PRCI_785_Items[0].HEADER[0].CHILDREN_COUNT +
              1;
        });
        _current =
            APIConstants.pi_89_PRI_207_PRCI_785_Items[0].CHILDREN.length > 0
                ? APIConstants
                    .pi_89_PRI_207_PRCI_785_Items[0].CHILDREN[initialImageIndex]
                : null;
      }
    }

    return DefaultTabController(
      length: 6,
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
              elevation: 6,
              backgroundColor: Colors.white,
              leadingWidth: 100,
              leading: MELBackButton(database: appDatabase, PI: SitesPagePI),
              actions: [
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.asset(
                      GlobalConfiguration().get("1716"),
                      height: 28,
                      width: 28,
                    )),
              ],
              title: Text(
                '${tvpSites_APP_DATA != null ? tvpSites_APP_DATA.strSummaryID : "Place"}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
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
                child: APIConstants.pi_87_PRI_205_PRCI_817_Items == null
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView(children: [
                          Column(children: [
                            // if(APIConstants.SitesItems.length > 0)
                            Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                    child: Text(
                                        tvpSites_APP_DATA?.strCrmSiteName ?? "",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)))),
                            TabBar(
                                isScrollable: true,
                                unselectedLabelColor: Colors.black,
                                indicatorColor: Colors.white,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorPadding: EdgeInsets.all(0),
                                labelPadding:
                                    EdgeInsets.only(left: 10, right: 5),
                                tabs: [
                                  Container(
                                    height: 50 +
                                        MediaQuery.of(context).padding.bottom,
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                                style: BorderStyle.solid))),
                                    child: Tab(
                                      child: Text('Summary',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Container(
                                    height: 50 +
                                        MediaQuery.of(context).padding.bottom,
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                                style: BorderStyle.solid))),
                                    child: Tab(
                                      child: Text('Documents',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    height: 50 +
                                        MediaQuery.of(context).padding.bottom,
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                                style: BorderStyle.solid))),
                                    child: Tab(
                                      child: Text('History',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    height: 50 +
                                        MediaQuery.of(context).padding.bottom,
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                                style: BorderStyle.solid))),
                                    child: Tab(
                                      child: Text('Reports',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    height: 50 +
                                        MediaQuery.of(context).padding.bottom,
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                                style: BorderStyle.solid))),
                                    child: Tab(
                                      child: Text('Tab 5',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  Container(
                                      height: 50 +
                                          MediaQuery.of(context).padding.bottom,
                                      padding: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                  style: BorderStyle.solid))),
                                      child: Tab(
                                        child: Text('Tab 6',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                            )),
                                      )),
                                ])
                          ]),
                          Container(
                              height: MediaQuery.of(context).size.height -
                                  (kBottomNavigationBarHeight + 200),
                              child: TabBarView(
                                children: <Widget>[
                                  ListView(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      children: [
                                        if (APIConstants
                                                .pi_89_PRI_207_PRCI_785_Items
                                                .length >
                                            0)
                                          if (APIConstants
                                                  .pi_89_PRI_207_PRCI_785_Items[
                                                      0]
                                                  .CHILDREN
                                                  .length ==
                                              0)
                                            Column(children: [
                                              // Text("Click to Upload",
                                              //     style: TextStyle(
                                              //         fontWeight: FontWeight.bold)),
                                              GestureDetector(
                                                  // onTap: () async {
                                                  //   await UtilMethods
                                                  //       .eventPageRegionChange(
                                                  //           appDatabase,
                                                  //           context,
                                                  //           794,
                                                  //           2,
                                                  //           null);
                                                  // },
                                                  child:
                                                      FadeInImage.assetNetwork(
                                                          height: 80,
                                                          image:
                                                              GlobalConfiguration()
                                                                  .get("98"),
                                                          placeholder:
                                                              GlobalConfiguration()
                                                                  .get("-1"),
                                                          imageErrorBuilder:
                                                              (c, v, b) {
                                                            return Image.asset(
                                                                GlobalConfiguration()
                                                                    .get("98"),
                                                                height: 200);
                                                          }))
                                            ]),

                                        if (APIConstants
                                                .pi_89_PRI_207_PRCI_785_Items
                                                .length >
                                            0)
                                          if (APIConstants
                                                  .pi_89_PRI_207_PRCI_785_Items[
                                                      0]
                                                  .CHILDREN
                                                  .length >
                                              0)
                                            GestureDetector(
                                                onTap: () async {
                                                  await UtilMethods
                                                      .eventPageRegionChange(
                                                          appDatabase,
                                                          context,
                                                          790,
                                                          2,
                                                          _current?.RK);
                                                },
                                                child: CarouselSlider(
                                                    options: CarouselOptions(
                                                        height: 200,
                                                        // enableInfiniteScroll:true,
                                                        aspectRatio: 16 / 9,
                                                        enlargeCenterPage:
                                                            false,
                                                        enableInfiniteScroll:
                                                            true,
                                                        viewportFraction: 1.0,
                                                        initialPage:
                                                            initialImageIndex ??
                                                                0,
                                                        autoPlay: false,
                                                        onPageChanged: (index,
                                                            reason) async {
                                                          setState(() {
                                                            _current = APIConstants
                                                                .pi_89_PRI_207_PRCI_785_Items[
                                                                    0]
                                                                .CHILDREN[index];
                                                          });
                                                          _current.URL_STRIP_VIEW =
                                                              await UtilMethods.eventNetworkURLCheck(
                                                                  appDatabase,
                                                                  context,
                                                                  URL: _current
                                                                      .URL_STRIP_VIEW,
                                                                  sasToken:
                                                                      sasToken);

                                                          // _getDotIndicator(
                                                          //     _current.INDEX1,
                                                          //     APIConstants
                                                          //         .pi_89_PRI_207_PRCI_785_Items[
                                                          //             0]
                                                          //         .CHILDREN
                                                          //         .length);
                                                        }),
                                                    items: getImageList())),
                                        if (APIConstants
                                                    .pi_89_PRI_207_PRCI_785_Items
                                                    .length >
                                                0 &&
                                            childrenCount.toInt() > 1)
                                          Center(
                                              child: AnimatedSmoothIndicator(
                                            activeIndex: _current.INDEX1 != null
                                                ? _current.INDEX1 - 1
                                                : 0,
                                            count: childrenCount - 1,
                                            effect: ScrollingDotsEffect(
                                                activeDotScale: 1.5,
                                                // fixedCenter: true,
                                                activeDotColor: Colors.black,
                                                dotHeight: 8.0,
                                                dotWidth: 8.0),
                                          )),

                                        // Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.center,
                                        //     children: _getDotIndicator(
                                        //         _current != null
                                        //             ? _current.INDEX1
                                        //             : 1,
                                        //         APIConstants
                                        //             .pi_89_PRI_207_PRCI_785_Items[
                                        //                 0]
                                        //             .CHILDREN
                                        //             .length)),
                                        if (tvpSites_APP_DATA != null)
                                          Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Column(
                                                // shrinkWrap: true,
                                                // physics:
                                                //     ClampingScrollPhysics(),
                                                children: [
                                                  Center(
                                                      child: Text(
                                                    "Summary",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Text(
                                                                "Name: ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Text(
                                                                "${tvpSites_APP_DATA.strCrmSiteName ?? ""}",
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    // fontWeight: FontWeight.bold,
                                                                    color: Colors.black),
                                                              ),
                                                            )
                                                          ])),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "User Code: ",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "${tvpSites_APP_DATA.strUserCode1 ?? ""}",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                // fontWeight: FontWeight.bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ]),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Type: ",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "${tvpSites_APP_DATA.strCrmSiteType ?? ""}",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                // fontWeight: FontWeight.bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ]),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Description: ",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        ExpandedText(
                                                            showFullText:
                                                                showDescriptionFull,
                                                            textString:
                                                                tvpSites_APP_DATA
                                                                        .strDescription ??
                                                                    "",
                                                            onTapFunc: () {
                                                              setState(() {
                                                                showDescriptionFull =
                                                                    !showDescriptionFull;
                                                              });
                                                            })
                                                      ]),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Status:",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "${tvpSites_APP_DATA.strActiveStatus ?? ""}",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                // fontWeight: FontWeight.bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ]),
                                                  if (jsonCrmCommunications
                                                          .length >
                                                      0)
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10),
                                                        child: Center(
                                                            child: Text(
                                                          "Communications",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20),
                                                        ))),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Column(
                                                          children:
                                                              jsonCrmCommunications
                                                                  .map((e) {
                                                        return Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  child: Row(
                                                                      children: [
                                                                        Image.asset(
                                                                            GlobalConfiguration().get(e.intWebAppResourceID
                                                                                .toString()),
                                                                            height:
                                                                                17,
                                                                            width:
                                                                                17),
                                                                        SizedBox(
                                                                            width:
                                                                                5),
                                                                        Text(
                                                                          "${e.strDescription}:",
                                                                          style: TextStyle(
                                                                              fontSize: 17,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.black),
                                                                        ),
                                                                      ])),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Tooltip(
                                                                  message:
                                                                      e.strData,
                                                                  child: Text(
                                                                      "${e.strData ?? ""}",
                                                                      style: TextStyle(
                                                                          fontSize: 17,
                                                                          // fontWeight: FontWeight.bold,
                                                                          color: Colors.black)),
                                                                ),
                                                              )
                                                            ]);
                                                      }).toList())),
                                                  if (jsonCrmAddresses.length >
                                                      0)
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10),
                                                        child: Center(
                                                            child: Text(
                                                          "Addresses",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20),
                                                        ))),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Text(
                                                                "GPS Location: ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Text(
                                                                "${tvpSites_APP_DATA.strGpsLocation ?? ""}",
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    // fontWeight: FontWeight.bold,
                                                                    color: Colors.black),
                                                              ),
                                                            )
                                                          ])),
                                                  Column(
                                                      children: jsonCrmAddresses
                                                          .map((e) {
                                                    return Container(
                                                        child:
                                                            Column(children: [
                                                      Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "${e.strType}:",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            )
                                                          ]),
                                                      Row(children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 30),
                                                            child: Text(
                                                                "${e.strCityStateZipCountryMobileApp ?? ""}",
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    // fontWeight: FontWeight.bold,
                                                                    color: Colors.black)))
                                                      ]),
                                                    ]));
                                                  }).toList()),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Center(
                                                          child: Text(
                                                        "Statistics",
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ))),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "People:",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ]),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Column(
                                                          children:
                                                              tvpSites_APP_DATA
                                                                  .jsonStatisticsCrmUsersDATA
                                                                  .map((e) {
                                                        return Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  "${e.strType}:",
                                                                  style: TextStyle(
                                                                      fontSize: 17,
                                                                      // fontWeight:
                                                                      // FontWeight
                                                                      //     .bold,
                                                                      color: Colors.black),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  "${e.strCount ?? ""}",
                                                                  style: TextStyle(
                                                                      fontSize: 17,
                                                                      // fontWeight: FontWeight.bold,
                                                                      color: Colors.black),
                                                                ),
                                                              )
                                                            ]);
                                                      }).toList())),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Things:",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ]),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Column(children: [
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  "SKUs:",
                                                                  style: TextStyle(
                                                                      fontSize: 17,
                                                                      // fontWeight:
                                                                      //     FontWeight
                                                                      //         .bold,
                                                                      color: Colors.black),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  "${tvpSites_APP_DATA.jsonStatisticsThingsDATA[0].strSkuCount ?? ""}",
                                                                  style: TextStyle(
                                                                      fontSize: 17,
                                                                      // fontWeight: FontWeight.bold,
                                                                      color: Colors.black),
                                                                ),
                                                              )
                                                            ]),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  "Inventory Value:",
                                                                  style: TextStyle(
                                                                      fontSize: 17,
                                                                      /*fontWeight:
                                                                          FontWeight
                                                                              .bold,*/
                                                                      color: Colors.black),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  "${tvpSites_APP_DATA.jsonStatisticsThingsDATA[0].strInventoryValue ?? ""}",
                                                                  style: TextStyle(
                                                                      fontSize: 17,
                                                                      // fontWeight: FontWeight.bold,
                                                                      color: Colors.black),
                                                                ),
                                                              )
                                                            ])
                                                      ])),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Documents:",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ]),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Column(children: [
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  "Files:",
                                                                  style: TextStyle(
                                                                      fontSize: 17,
                                                                      // fontWeight:
                                                                      //     FontWeight
                                                                      //         .bold,
                                                                      color: Colors.black),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  "${tvpSites_APP_DATA.jsonStatisticsStorageItemsDATA[0].strStorageItemsCount ?? ""}",
                                                                  style: TextStyle(
                                                                      fontSize: 17,
                                                                      // fontWeight: FontWeight.bold,
                                                                      color: Colors.black),
                                                                ),
                                                              )
                                                            ]),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  "Pages:",
                                                                  style: TextStyle(
                                                                      fontSize: 17,
                                                                      // fontWeight:
                                                                      //     FontWeight
                                                                      //         .bold,
                                                                      color: Colors.black),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  "${tvpSites_APP_DATA.jsonStatisticsStorageItemsDATA[0].strPagesCount ?? ""}",
                                                                  style: TextStyle(
                                                                      fontSize: 17,
                                                                      // fontWeight: FontWeight.bold,
                                                                      color: Colors.black),
                                                                ),
                                                              )
                                                            ]),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  "Part Numbers:",
                                                                  style: TextStyle(
                                                                      fontSize: 17,
                                                                      // fontWeight:
                                                                      // FontWeight
                                                                      //     .bold,
                                                                      color: Colors.black),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  "${tvpSites_APP_DATA.jsonStatisticsStorageItemsDATA[0].strIdentifiedPartNumbers ?? ""}",
                                                                  style: TextStyle(
                                                                      fontSize: 17,
                                                                      // fontWeight: FontWeight.bold,
                                                                      color: Colors.black),
                                                                ),
                                                              )
                                                            ]),
                                                      ])),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Center(
                                                          child: Text(
                                                        "History",
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ))),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Created:",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "${tvpSites_APP_DATA.strCreatedDate ?? ""}",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                // fontWeight: FontWeight.bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ]),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "By:",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "${tvpSites_APP_DATA.strCreatedBy ?? ""}",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                // fontWeight: FontWeight.bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ]),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10, bottom: 18),
                                                      child: Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                60,
                                                            height: 50.0,
                                                            child:
                                                                ElevatedButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all<
                                                                              Color>(
                                                                          Colors
                                                                              .grey)),
                                                              onPressed:
                                                                  () async {
                                                                UtilMethods
                                                                    .eventPageRegionChange(
                                                                        appDatabase,
                                                                        context,
                                                                        828,
                                                                        2,
                                                                        null);
                                                              },
                                                              child: Text(
                                                                  "Edit",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18)),
                                                            ),
                                                          )))
                                                ]),
                                          )
                                      ]),
                                  Container(
                                    child: Center(
                                      child: Text('Documents'),
                                    ),
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text('History'),
                                    ),
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text('Reports'),
                                    ),
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text('Tab 5'),
                                    ),
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text('Tab 6'),
                                    ),
                                  ),
                                ],
                              ))
                        ]))),
            if (GlobalState.apiLoading) PageDataLoader(),
          ])),
    );
  }

// _getDotIndicator(currentIndex, overAllCount) {
//   try {
//     double convertCount = (currentIndex / 4);
//     int needMinusCount = (convertCount.ceil() * 4);
//     int minusCount = 4 - (currentIndex - (needMinusCount)).abs();
//     print(minusCount);
//     List<Widget> childrens = [];
//     List<int> lists = new List<int>.generate(
//         (overAllCount - currentIndex) + minusCount >= 4 ? 4 : 5,
//         (i) => i + 1);
//     for (int item in lists) {
//       print(item);
//       print("==========Items==========");
//       var child = Container(
//           width: (currentIndex >= 4 && item == 1) ? 4.0 : 8.0,
//           height: (currentIndex >= 4 && item == 1) ? 4.0 : 8.0,
//           margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
//           decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: ((currentIndex >= 4
//                           ? (minusCount + 1)
//                           : currentIndex + 1) ==
//                       item)
//                   ? Color.fromRGBO(0, 0, 0, 0.9)
//                   : Color.fromRGBO(0, 0, 0, 0.4)));
//       childrens.add(child);
//     }
//
//     if ((overAllCount - currentIndex) + minusCount >= 5) {
//       var additionalChild = Container(
//           width: 4.0,
//           height: 4.0,
//           margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
//           decoration: BoxDecoration(
//               shape: BoxShape.circle, color: Color.fromRGBO(0, 0, 0, 0.4)));
//       childrens.add(additionalChild);
//     }
//     return childrens;
//   } catch (e, stacktrace) {
//     print(e.toString());
//     print(stacktrace.toString());
//     UtilMethods.ErrorCall(appDatabase, context, e.toString(), 623);
//   }
// }
}

// APIConstants
//     .pi_89_PRI_207_PRCI_785_Items[0]
// .CHILDREN
//     .map((item) => Container(
// width: 8.0,
// height: 8.0,
// margin: EdgeInsets.symmetric(
// vertical: 10.0,
// horizontal: 2.0),
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: _current?.INDEX1 ==
// item.INDEX1
// ? Color.fromRGBO(
// 0, 0, 0, 0.9)
// : Color.fromRGBO(
// 0, 0, 0, 0.4))))
// .toList()
