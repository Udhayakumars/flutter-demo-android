import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/organization/PI_89_PRI_207_PRCI_785_Items.dart';
import 'package:MMLMobile/models/organization/PI_92_PRI_210_PRCI_787_Items.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:global_state/gs.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'ImageViewEdit.dart';

class ImageView extends StatefulWidgetGS {
  const ImageView({Key key}) : super(key: key);

  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<ImageView> {
  AppDatabase database;

  int imageIndex = null;
  bool startZoom = false;
  PageController pageController;
  String progress = "0";
  bool isDownloaded = false;
  bool downloading = false;
  bool fileExist = true;
  @override
  void initState() {
    GlobalState.downloadFileTaskID = null;
    builder();
    FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  int imageViewPagePI = 92;

  void onPageChanged(int index) async {
    GlobalState.downloadFileTaskID = null;
    setState(() {
      imageIndex = index;
    });
    await fileExistCheck();
  }

  static void downloadCallback(id, status, progress) async {
    // if(debug) {
    print(
        'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    // }
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port');

    if (status == DownloadTaskStatus.complete) {
      GlobalState.downloadFileTaskID = id;
    }
    // send.send([id, status, progress]);
  }

  // void _onHarizontalSwipe(SwipeDirection direction) {
  //   setState(() {
  //     if (direction == SwipeDirection.left) {
  //       imageIndex =
  //           (APIConstants.pi_92_PRI_210_PRCI_787_Items[0].CHILDREN.length - 1) >
  //                   imageIndex
  //               ? imageIndex + 1
  //               : 0;
  //       print(imageIndex);
  //     } else if (direction == SwipeDirection.right) {
  //       imageIndex = imageIndex == 0
  //           ? (APIConstants.pi_92_PRI_210_PRCI_787_Items[0].CHILDREN.length - 1)
  //           : imageIndex - 1;
  //     }
  //   });
  // }

  String sasToken = null;
  getSAS_token() async {
    await Preference.getItem("SAS_Token").then((value) => {
          setState(() {
            sasToken = value;
          })
        });
  }

  builder() async {
    database = await $FloorAppDatabase.databaseBuilder('mml.db').build();
    getSAS_token();
  }

  Future<String> fileExistCheck() async {
    var dir = await getApplicationDocumentsDirectory();
    final fileName = APIConstants
        .pi_92_PRI_210_PRCI_787_Items[0].CHILDREN[imageIndex].UP_FILE;
    final filePath = "${dir.path + "/" + fileName}";
    if (File(filePath).existsSync()) {
      setState(() {
        fileExist = true;
      });
    } else {
      setState(() {
        fileExist = false;
      });
    }
    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    if (APIConstants.pi_92_PRI_210_PRCI_787_Items.length > 0) {
      if (APIConstants
                  .pi_92_PRI_210_PRCI_787_Items[0].HEADER[0].INITIAL_INDEX1 !=
              null &&
          imageIndex == null) {
        fileExistCheck();
        setState(() {
          imageIndex = APIConstants
                  .pi_92_PRI_210_PRCI_787_Items[0].HEADER[0].INITIAL_INDEX1 -
              1;
          pageController = PageController(initialPage: imageIndex);
        });
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () async {
              print("Calling EventBack");
              if (!GlobalState.apiLoading) {
                await UtilMethods.eventBack(database, context, GlobalState.PI,
                    dataRequestKeys: APIConstants
                        .pi_92_PRI_210_PRCI_787_Items[0]
                        .CHILDREN[imageIndex]
                        .RK);
                APIConstants.pi_92_PRI_210_PRCI_787_Items = [];
              }
              // Navigator.of(context).pop();
            },
          ),
          actions: [
            Center(
                child: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Text(imageIndex != null
                        ? "${imageIndex + 1} of ${APIConstants.pi_92_PRI_210_PRCI_787_Items.length > 0 ? APIConstants.pi_92_PRI_210_PRCI_787_Items[0].HEADER[0].CHILDREN_COUNT : 0}"
                        : ""))),
            // IconButton(icon: Icon(Icons.grid_on), onPressed: () {})
          ],
        ),
        body: Stack(children: [
          Visibility(
            child: Text(GlobalState.pageDataLoaded.toString()),
            visible: false,
          ),
          APIConstants.pi_92_PRI_210_PRCI_787_Items.length > 0 &&
                  sasToken != null
              ? Container(
                  child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    UtilMethods.evictImage(
                        "${APIConstants.pi_92_PRI_210_PRCI_787_Items[0].CHILDREN[imageIndex].URL_STRIP_VIEW + sasToken}");
                    return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(APIConstants
                                  .pi_92_PRI_210_PRCI_787_Items[0]
                                  .CHILDREN[imageIndex]
                                  .URL_STRIP_VIEW !=
                              null
                          ? APIConstants.pi_92_PRI_210_PRCI_787_Items[0]
                                  .CHILDREN[imageIndex].URL_STRIP_VIEW +
                              sasToken
                          : ""),
                      initialScale: PhotoViewComputedScale.contained * 0.8,
                      // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
                    );
                  },
                  itemCount: APIConstants
                      .pi_92_PRI_210_PRCI_787_Items[0].CHILDREN.length,
                  loadingBuilder: (context, event) => Center(
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        value: event == null
                            ? 0
                            : event.cumulativeBytesLoaded /
                                event.expectedTotalBytes,
                      ),
                    ),
                  ),
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  pageController: pageController,
                  onPageChanged: onPageChanged,
                ))
              : Text(""),
          if (APIConstants.pi_92_PRI_210_PRCI_787_Items.length > 0 &&
              sasToken != null)
            Padding(
                padding: EdgeInsets.all(20.0),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                        child: Text(fileExist
                            ? "Open"
                            : (downloading
                                ? "Downloading $progress %"
                                : "Download")),
                        onPressed: () async {
                          Dio dio = Dio();

                          final filePath = await fileExistCheck();
                          if (!fileExist) {
                            downloading = true;
                            dio.download(
                              APIConstants.pi_92_PRI_210_PRCI_787_Items[0]
                                      .CHILDREN[imageIndex].URL_DOWNLOAD +
                                  sasToken,
                              filePath,
                              onReceiveProgress: (rcv, total) {
                                print(
                                    'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');

                                setState(() {
                                  progress =
                                      ((rcv / total) * 100).toStringAsFixed(0);
                                });

                                if (progress == '100') {
                                  setState(() {
                                    isDownloaded = true;
                                  });
                                } else if (double.parse(progress) < 100) {}
                              },
                              deleteOnError: true,
                            ).then((_) {
                              setState(() {
                                if (progress == '100') {
                                  isDownloaded = true;
                                }
                                fileExist = true;
                                OpenFile.open(filePath);
                                downloading = false;
                              });
                            });
                          } else {
                            OpenFile.open(filePath);
                          }
                        })
                  ])
                ])),
          if (APIConstants.pi_92_PRI_210_PRCI_787_Items.length > 0 &&
              sasToken != null)
            Container(
                color: Colors.black,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  if (APIConstants.pi_92_PRI_210_PRCI_787_Items[0]
                          .CHILDREN[imageIndex].EDIT_PGP !=
                      null)
                    IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          await UtilMethods.eventPageRegionChange(
                              database,
                              context,
                              APIConstants.pi_92_PRI_210_PRCI_787_Items[0]
                                  .CHILDREN[imageIndex].EDIT_PGP,
                              2,
                              APIConstants.pi_92_PRI_210_PRCI_787_Items[0]
                                  .CHILDREN[imageIndex].RK);
                        }),
                  IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.more_vert_outlined),
                      onPressed: () {
                        displayBottomSheet(context);
                      })
                ])),
          if (GlobalState.apiLoading) PageDataLoader()
        ]));
  }

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.transparent,
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
                          'Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Name",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          APIConstants
                                              .pi_92_PRI_210_PRCI_787_Items[0]
                                              .CHILDREN[imageIndex]
                                              .UP_FILE,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16))
                                    ]),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  Text("Size",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ]),
                                Column(children: [
                                  Text(
                                      APIConstants
                                          .pi_92_PRI_210_PRCI_787_Items[0]
                                          .CHILDREN[imageIndex]
                                          .FILE_SIZE,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16))
                                ])
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  Text("User",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ]),
                                Column(children: [
                                  Text(
                                      APIConstants
                                          .pi_92_PRI_210_PRCI_787_Items[0]
                                          .CHILDREN[imageIndex]
                                          .UP_USER,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ])
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  Text("Date",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ]),
                                Column(children: [
                                  Text(
                                      APIConstants
                                          .pi_92_PRI_210_PRCI_787_Items[0]
                                          .CHILDREN[imageIndex]
                                          .UP_DATE,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ])
                              ])
                        ]))
                  ],
                ));
          });
        });
  }
}
