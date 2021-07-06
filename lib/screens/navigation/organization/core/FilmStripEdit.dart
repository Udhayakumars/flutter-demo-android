import 'dart:io';
import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/screens/navigation/organization/core/videoCapture.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:global_configuration/global_configuration.dart';
import 'package:global_state/gs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:intl/intl.dart';

class ThingsImageEdit extends StatefulWidgetGS {
  final File file;

  const ThingsImageEdit({Key key, this.file}) : super(key: key);

  @override
  _ThingsImageEditState createState() => _ThingsImageEditState();
}

class _ThingsImageEditState extends State<ThingsImageEdit> {
  bool dragging = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final picker = ImagePicker();
  AppDatabase appDatabase;
  File videoFile;
  String sasToken = "";
  builder() async {
    APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
    final sasTokenPref = await Preference.getItem('SAS_Token');
    setState(() {
      sasToken = sasTokenPref;
      if (widget.file != null) {
        videoFile = widget.file;
      }
    });
    if (widget.file != null) {
      await getImage("video");
    }
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  Future getImage(source) async {
    try {
      source != "video" ? Navigator.of(context).pop() : null;
      List<File> files = [];
      if (source == "camera") {
        final pickedFile = await picker.getImage(source: ImageSource.camera);
        if (pickedFile != null) {
          File file = File(pickedFile.path);
          var directory = await getApplicationSupportDirectory();
          File renamedFile = File(directory.path +
              "/Mobile_Image_${DateFormat('yyyy-MM-dd_hh:mm:ss').format(DateTime.now().toLocal())}.png");
          renamedFile.writeAsBytes(file.readAsBytesSync());
          files.add(renamedFile);
          file.deleteSync();
        } else {
          print('No image selected.');
        }
      } else if (source == "video") {
        if (videoFile != null) {
          files.add(videoFile);
        }
      } else {
        FilePickerResult result = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          type: FileType.media,
          // allowedExtensions: ['xlsx']
        );

        if (result != null) {
          files = result.paths.map((path) => File(path)).toList();
        } else {
          // User canceled the picker
        }
      }
      if (files.length > 0) {
        GlobalState.pageDataLoaded = true;
        APIConstants.filmStripImages.addAll(files);
        APIConstants.uploadingfilmStripImages.addAll(files);
        GlobalState.pageDataLoaded = false;
        for (File file in files) {
          await UtilMethods.eventUploadFile(appDatabase, context, 216, file);
          APIConstants.uploadingfilmStripImages.indexOf(file) != -1
              ? APIConstants.uploadingfilmStripImages
                  .removeAt(APIConstants.uploadingfilmStripImages.indexOf(file))
              : null;
          file.deleteSync();
          APIConstants.filmStripImages
              .addAll(APIConstants.uploadingfilmStripImages);
          // await Future.delayed(Duration(seconds: 5));
          GlobalState.pageDataLoaded = true;

          GlobalState.pageDataLoaded = false;
        }
        ;

        if (APIConstants.uploadingfilmStripImages.length == 0) {
          UtilMethods.eventRefresh(appDatabase, context, eventID: 220);
        }
        // GlobalState.pageDataLoaded = false;
      }
    } catch (e, stacktrace) {
      print(e.toString());
      print(stacktrace.toString());
      UtilMethods.ErrorCall(appDatabase, context, e.toString(), 623);
    }
  }

  List<T> splice<T>(List<T> list, int index,
      [num howMany = 0, /*<T | List<T>>*/ elements]) {
    var endIndex = index + howMany.truncate();
    list.removeRange(index, endIndex >= list.length ? list.length : endIndex);
    if (elements != null) list.insert(index, (elements));
    return list;
  }

  int variableSet = 0;
  ScrollController _scrollController;
  double width;
  double height;

  @override
  void initState() {
    imageCache.clear();
    super.initState();
    builder();
  }

  Future<Null> _refresh() async {
    // UtilMethods.bef
    UtilMethods.eventRefresh(appDatabase, context, eventID: 220);
    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Photos",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: !GlobalState.apiLoading
            ? GestureDetector(
                onTap: () {
                  UtilMethods.eventBack(appDatabase, context, 94);
                },
                child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black)),
              )
            : Text(""),
        actions: [],
      ),
      body: sasToken == ""
          ? Center(child: CircularProgressIndicator())
          : Stack(children: [
              Visibility(
                child: Text(GlobalState.pageDataLoaded.toString()),
                visible: false,
              ),
              LiquidPullToRefresh(
                  borderWidth: 1,
                  height: 50,
                  animSpeedFactor: 6,
                  color: Colors.black,
                  backgroundColor: Colors.blueAccent,
                  springAnimationDurationInMilliseconds: 3000,
                  onRefresh: _refresh,
                  showChildOpacityTransition: false,
                  child: ListView(children: [
                    DragAndDropGridView(
                      isCustomChildWhenDragging: dragging,
                      // header: Text("${dragging}"),
                      controller: _scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 5 / 5,
                      ),
                      padding: EdgeInsets.all(20),
                      itemBuilder: (context, index) => Card(
                        elevation: 2,
                        child: LayoutBuilder(builder: (context, costrains) {
                          if (variableSet == 0) {
                            height = costrains.maxHeight;
                            width = costrains.maxWidth;
                            variableSet++;
                          }

                          if (APIConstants.filmStripImages[index] is String) {
                            UtilMethods.evictImage(
                                APIConstants.filmStripImages[index] + sasToken);
                          }
                          return GridTile(
                            child: GestureDetector(
                                onTap: () async {
                                  if (APIConstants.uploadingfilmStripImages
                                              .indexOf(APIConstants
                                                  .filmStripImages[index]) ==
                                          -1 &&
                                      APIConstants.filmStripImages[index]
                                          is String) {
                                    await UtilMethods.eventPageRegionChange(
                                        appDatabase,
                                        context,
                                        790,
                                        2,
                                        APIConstants
                                            .pi_94_PRI_212_PRCI_796_Items[0]
                                            .CHILDREN[index]
                                            .RK);
                                  }
                                },
                                child: Stack(children: [
                                  (APIConstants.filmStripImages[index]
                                          is String)
                                      ? Image.network(
                                          APIConstants.filmStripImages[index] +
                                              sasToken,
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.16,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.30,

                                          // placeholder:
                                          //     GlobalConfiguration().get("-1"),

                                          errorBuilder: (c, v, b) {
                                          return Image.asset(
                                              GlobalConfiguration().get("1603"),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.16,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.30);
                                        })
                                      : Image.file(
                                          APIConstants.filmStripImages[index],
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.16,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.30),
                                  if (APIConstants.uploadingfilmStripImages
                                          .indexOf(APIConstants
                                              .filmStripImages[index]) !=
                                      -1)
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.16,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.30,
                                        color: Colors.black87,
                                        child: Center(
                                            child: CircularProgressIndicator()))
                                ])),
                          );
                        }),
                      ),
                      itemCount: APIConstants.filmStripImages.length,
                      onWillAccept: (oldIndex, newIndex) => true,
                      onReorder: (oldIndex, newIndex) {
                        // You can also implement on your own logic on reorderable
                        int indexOfFirstItem = APIConstants.filmStripImages
                            .indexOf(APIConstants.filmStripImages[oldIndex]);
                        int indexOfSecondItem = APIConstants.filmStripImages
                            .indexOf(APIConstants.filmStripImages[newIndex]);

                        if (indexOfFirstItem > indexOfSecondItem) {
                          for (int i = APIConstants.filmStripImages.indexOf(
                                  APIConstants.filmStripImages[oldIndex]);
                              i >
                                  APIConstants.filmStripImages.indexOf(
                                      APIConstants.filmStripImages[newIndex]);
                              i--) {
                            var tmp = APIConstants.filmStripImages[i - 1];
                            APIConstants.filmStripImages[i - 1] =
                                APIConstants.filmStripImages[i];
                            APIConstants.filmStripImages[i] = tmp;
                          }
                        } else {
                          for (int i = APIConstants.filmStripImages.indexOf(
                                  APIConstants.filmStripImages[oldIndex]);
                              i <
                                  APIConstants.filmStripImages.indexOf(
                                      APIConstants.filmStripImages[newIndex]);
                              i++) {
                            var tmp = APIConstants.filmStripImages[i + 1];
                            APIConstants.filmStripImages[i + 1] =
                                APIConstants.filmStripImages[i];
                            APIConstants.filmStripImages[i] = tmp;
                          }
                        }
                        setState(() {});
                      },
                    )
                  ])),
              if (GlobalState.apiLoading)
                PageDataLoader()
            ]),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          color: Colors.black,
          height: 50.0,
          child: Row(
            children: [
              // Expanded(
              //     child: Padding(
              //   padding: EdgeInsets.only(right: 8.0),
              //   child: Align(
              //       alignment: Alignment.centerRight,
              //       child: GestureDetector(
              //         child: Text(
              //           "Select",
              //           style: TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.blue),
              //         ),
              //       )),
              // ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          displayBottomSheet(context);
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (ctx) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Wrap(children: [
                  ListTile(
                    title: Text(
                      "Choose from Gallery",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () async {
                      await getImage("gallery");
                    },
                  ),
                  ListTile(
                    title: Text("Camera", style: TextStyle(color: Colors.blue)),
                    onTap: () async {
                      await getImage("camera");
                    },
                  ),
                  ListTile(
                    title: Text("Video", style: TextStyle(color: Colors.blue)),
                    onTap: () async {
                      return pushNewScreen(
                        context,
                        screen: VideoRecorder(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                ]));
          });
        });
  }
}
