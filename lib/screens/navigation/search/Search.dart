import 'dart:async';

import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:global_state/gs.dart';

class SearchScreen extends StatefulWidgetGS {
  @override
  _SearchEngineState createState() => _SearchEngineState();
}

class _SearchEngineState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  // TabController _tabController1;
  TabController _tabController2;

  TextEditingController _searchTextController = new TextEditingController();
  String _scanBarcode = '';

  @override
  void initState() {
    // _tabController1 = new TabController( length: _widgets1.length, vsync: this);
    _tabController2 = new TabController(length: _widgets2.length, vsync: this);
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcode() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _searchTextController.text = barcodeScanRes;
      print(barcodeScanRes);
    });
  }

  @override
  void dispose() {
    // _tabController1.dispose();
    _tabController2.dispose();
    super.dispose();
  }

  // List<Widget> _widgets1 = [
  //   Icon(Icons.settings),
  //   Icon(Icons.settings),
  //   Icon(Icons.settings),
  //   Icon(Icons.settings),
  //   Icon(Icons.settings),
  //   Icon(Icons.message_outlined),
  // ];
  List<Widget> _widgets2 = [
    Icon(Icons.settings),
    Icon(Icons.message_outlined),
  ];
  @override
  Widget build(BuildContext context) {
    print("search called");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(100.0), // here the desired height
            child: Column(
              children: [
                Row(children: [
                  new Container(
                    padding: EdgeInsets.only(top: 5, left: 5, bottom: 0),
                    height: 60.0,
                    width: 330.0,
                    child: TextFormField(
                      controller: _searchTextController,
                      cursorColor: Colors.brown,
                      autofocus: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.camera_alt_outlined),
                          color: Colors.grey,
                          onPressed: () async {
                            await scanBarcode();
                          },
                        ),
                        prefixIconConstraints:
                            BoxConstraints(maxHeight: 20, maxWidth: 20),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0.0,
                          horizontal: 10.0,
                        ),
                        filled: true,
                        hintText: 'Search for anything',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide:
                              BorderSide(width: 0.0, style: BorderStyle.none),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(3)),
                  GestureDetector(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                            fontSize: 16),
                      ),
                      onTap: null)
                ]),
                DefaultTabController(
                  length: 6,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.050,
                    width: MediaQuery.of(context).size.width - 4,
                    child: TabBar(
                        // controller: _tabController1,
                        isScrollable: true,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: EdgeInsets.all(0),
                        labelPadding: EdgeInsets.all(3),
                        tabs: [
                          Container(
                            height: 50 + MediaQuery.of(context).padding.bottom,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                        style: BorderStyle.solid))),
                            child: Tab(
                              child: Text('All',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            height: 50 + MediaQuery.of(context).padding.bottom,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                        style: BorderStyle.solid))),
                            child: Tab(
                              child: Text('People',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            height: 50 + MediaQuery.of(context).padding.bottom,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                        style: BorderStyle.solid))),
                            child: Tab(
                              child: Text('Places',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            height: 50 + MediaQuery.of(context).padding.bottom,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                        style: BorderStyle.solid))),
                            child: Tab(
                              child: Text('Things',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            height: 50 + MediaQuery.of(context).padding.bottom,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                        style: BorderStyle.solid))),
                            child: Tab(
                              child: Text('Events',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                              height:
                                  50 + MediaQuery.of(context).padding.bottom,
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                          style: BorderStyle.solid))),
                              child: Tab(
                                child: Text('Documents',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold)),
                              )),
                        ]),
                    color: Colors.white,
                  ),
                ),
                DefaultTabController(
                  length: 2,
                  child: Container(
                    child: TabBar(
                      controller: _tabController2,
                      labelPadding: EdgeInsets.all(2),
                      indicatorColor: Colors.brown, // 3C89CB
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.brown,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 2.0,
                      indicatorPadding: EdgeInsets.only(left: 2.0, right: 2.0),
                      isScrollable: false,
                      physics: ScrollPhysics(),
                      tabs: [
                        Tab(text: 'Recent'),
                        Tab(text: 'Saved'),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
      body: Stack(children: [
        Container(
            child: TabBarView(
          controller: _tabController2,
          children: <Widget>[
            Container(
              child: Center(
                child: Text('Recent'),
              ),
            ),
            Container(
              color: Colors.grey[200],
              child: Center(
                  child: ListView(
                children: [
                  Container(
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text(
                        "Searches",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Text("m.1016.9521", style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Text("instapak #20", style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Icon(Icons.stop_circle, color: Colors.brown, size: 16),
                        SizedBox(width: 10),
                        Text("1016.2050", style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Icon(Icons.stop_circle, color: Colors.brown, size: 16),
                        SizedBox(width: 10),
                        Text("1016.2050", style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Icon(Icons.stop_circle, color: Colors.brown, size: 16),
                        SizedBox(width: 10),
                        Text("1016.2050", style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Text("m.1016.9521", style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Text("instapak #20", style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ],
        )),
        if(GlobalState.apiLoading) PageDataLoader()
      ]),
    );
  }
}
