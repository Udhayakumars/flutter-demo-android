import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:MMLMobile/customwidgets/CropFile.dart';
import 'package:MMLMobile/customwidgets/ImageView.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/organization/PI_89_PRI_207_PRCI_785_Items.dart';
import 'package:MMLMobile/models/organization/PI_92_PRI_210_PRCI_787_Items.dart';
import 'package:MMLMobile/models/organization/PI_95_PRI_213_PRCI_805_Items.dart';
import 'package:MMLMobile/screens/navigation/organization/core/VideoTrimmer.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:flutter_image_editor/flutter_image_editor.dart';
import 'package:global_state/gs.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:intl/intl.dart';

import 'PageDataLoader.dart';

// import 'package:path/path.dart';

class ImageViewEdit extends StatefulWidgetGS {
  const ImageViewEdit({Key key}) : super(key: key);

  @override
  _ImageViewEditState createState() => _ImageViewEditState();
}

class _ImageViewEditState extends State<ImageViewEdit> {
  AppDatabase database;
  final cropKey = GlobalKey<CropState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _currentBrightnessValue = 0.0;
  double _currentContrastValue = 1;
  bool showBrightnessSlider = false;
  double _brightness = 0;
  double _contrast = 1;
  StreamController<Uint8List> _pictureStream;
  dynamic response;
  bool imageLoading = false;

  File _file;
  File _sample;
  File _editedImage;
  double currentRotate = 0;
  String loaderText = "";

  @override
  void initState() {
    builder();

    _pictureStream = new StreamController<Uint8List>();
    if (GlobalState.PRI == 215) {
      loadVideoEdit();
    }
    super.initState();
  }

  loadVideoEdit() async {
    // super.deactivate();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ImageView();
    }));
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int imageViewPagePI = 95;
  String sasToken = null;

  //GET SAS TOKEN FROM PREFERENCE
  getSAS_token() async {
    await Preference.getItem("SAS_Token").then((value) => {
          if (mounted)
            {
              setState(() {
                sasToken = value;
              })
            }
        });
  }

  builder() async {
    database = await $FloorAppDatabase.databaseBuilder('mml.db').build();
    getSAS_token();
  }

  //SLIDERS INCREASE BRIGHTNESS
  void setBrightness(double valor) {
    if (mounted) {
      setState(() {
        _brightness = valor;
      });
    }
  }

  //SLIDERS INCREASE CONTRAST
  void setContrast(double valor) {
    if (mounted) {
      setState(() {
        _contrast = valor;
      });
    }
  }

  int _selectedIndex = 0;

  //BOTTOM NAVIGATION CLICK EVENTS
  void _onTappedHandler(int index) async {
    if (mounted) {
      setState(() {
        _selectedIndex = index;
      });
    }
    final image =
        _editedImage == null ? await _fileFromImageUrl() : _editedImage;
    if (mounted) {
      setState(() {
        showBrightnessSlider = false;
        _editedImage = image;
      });
    }
    switch (index) {
      case 0:
        setState(() {
          imageLoading = true;
          loaderText = "Reverting your changes...";
        });
        UtilMethods.evictImage(
            "${APIConstants.pi_95_PRI_213_PRCI_805_Items[0].URLD4 + sasToken}");
        APIConstants.pi_95_PRI_213_PRCI_805_ImageResponse =
            await UtilMethods.networkURLResponse(
                APIConstants.pi_95_PRI_213_PRCI_805_Items[0].URLD4);
        File file = await _fileFromImageUrl();
        if (mounted) {
          setState(() {
            imageLoading = false;
            loaderText = "";
          });
        }
        if (file != null) {
          if (mounted) {
            setState(() {
              _editedImage = file;
            });
          }
        }
        break;
      case 1:
        if (mounted) {
          setState(() {
            showBrightnessSlider = true;
            _pictureStream = new StreamController<Uint8List>();
          });
        }
        break;
      case 2:
        _cropImage(_editedImage.path);
        break;
      case 3:
        final rotate = 90.0;
        print(rotate);

        List<int> bytes = await PictureEditor.rotateImage(
            _editedImage.readAsBytesSync(), rotate);
        File file = await _removePreviousLocalFileAndAddFile(bytes);
        if (mounted) {
          setState(() {
            _editedImage = file;
            currentRotate = rotate;
          });
        }
        break;
    }
  }

  //REMOVE OLD FILE AND ADD THE NEW FILE
  Future<File> _removePreviousLocalFileAndAddFile(Uint8List bytes) async {
    var documentDirectory = await getApplicationSupportDirectory();
    print(documentDirectory);
    List<FileSystemEntity> listofFiles = documentDirectory.listSync();
    listofFiles.forEach((element) {
      element.deleteSync();
    });
    File fileT = await new File(documentDirectory.path +
            '/Mobile_Image_${DateFormat('yyyy-MM-dd_hh:mm:ss').format(DateTime.now().toLocal())}.png')
        .writeAsBytes(bytes);
    return fileT;
  }

  //CROP IMAGE EVENT
  _cropImage(String filePath) async {
    File croppedImage = await ImageCropper.cropImage(sourcePath: filePath);
    if (croppedImage != null) {
      File file = await _removePreviousLocalFileAndAddFile(
          croppedImage.readAsBytesSync());
      croppedImage.delete();
      setState(() {
        _editedImage = file;
      });
    }
  }

  //FILE FROM APIRESPONSE AND BACK INTO FILE
  Future<File> _fileFromImageUrl() async {
    if (APIConstants.pi_95_PRI_213_PRCI_805_ImageResponse != "" &&
        APIConstants.pi_95_PRI_213_PRCI_805_ImageResponse != null) {
      var documentDirectory = await getApplicationSupportDirectory();

      File file = new File(documentDirectory.path +
          '/Mobile_Image_${DateFormat('yyyy-MM-dd_hh:mm:ss').format(DateTime.now().toLocal())}.png');

      await file.writeAsBytes(
          APIConstants.pi_95_PRI_213_PRCI_805_ImageResponse.bodyBytes);
      return file;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(GlobalState.PRI);
    return !showBrightnessSlider
        ? normalScaffoldWidget(context)
        : Scaffold(
            // key: _scaffoldKey,
            appBar: appBar(),
            body: bodyWidget());
  }

  Widget normalScaffoldWidget(BuildContext context) {
    return Scaffold(
        // key: _scaffoldKey,
        appBar: appBar(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          // fixedColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.refresh,
                color: Colors.blue,
              ),
              label: 'Original',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.brightness_4, color: Colors.blue),
              label: 'Brightness',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.crop, color: Colors.blue),
              label: 'Crop',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.screen_rotation, color: Colors.blue),
              label: 'Rotate',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete, color: Colors.blue),
              label: 'Delete',
              backgroundColor: Colors.black,
            ),
          ],
          currentIndex: _selectedIndex,
          // selectedItemColor: Colors.amber[800],
          onTap: _onTappedHandler,
        ),
        body: bodyWidget());
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      leadingWidth: showBrightnessSlider ? 40 : 80,
      title: Center(
          child: Text("Edit Photo",
              style: TextStyle(fontSize: 18, color: Colors.white))),
      leading: showBrightnessSlider
          ? Text("")
          : GestureDetector(
              onTap: () async {
                if(!GlobalState.apiLoading)
                await UtilMethods.eventBack(database, context, GlobalState.PI);
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("CANCEL",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
              ),
            ),
      actions: [
        showBrightnessSlider
            ? Text("")
            : Center(
                child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: TextButton(
                        onPressed: () async {
                          if (mounted) {
                            setState(() {
                              imageLoading = true;
                              loaderText = "Saving your changes...";
                            });
                            await UtilMethods.eventUploadFile(
                                database, context, 243, _editedImage);
                            setState(() {
                              imageLoading = false;
                              loaderText = "";
                            });
                          }
                          UtilMethods.eventBack(database, context, 95);
                        },
                        child: Text("SAVE",
                            style:
                                TextStyle(fontSize: 14, color: Colors.blue))))),
        // IconButton(icon: Icon(Icons.grid_on), onPressed: () {})
      ],
    );
  }

  Future<void> brightnessSave() async {
    var bytes = await PictureEditor.editImage(_editedImage.readAsBytesSync(),
        _currentContrastValue, _currentBrightnessValue);
    File file = await _removePreviousLocalFileAndAddFile(bytes);
    if (mounted) {
      setState(() {
        _editedImage = file;
        showBrightnessSlider = false;
        _currentContrastValue = 1;
        _currentBrightnessValue = 0.0;
      });
    }
  }

  Widget bodyWidget() {
    return Stack(children: [
      Visibility(
        child: Text(GlobalState.pageDataLoaded.toString()),
        visible: false,
      ),
      APIConstants.pi_95_PRI_213_PRCI_805_Items.length == 0 &&
              !GlobalState.pageDataLoaded
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: showBrightnessSlider
                  ? Container(
                      // height: 300,
                      // width: 300,
                      child: StreamBuilder(
                      stream: _pictureStream.stream,
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          return Image.memory(
                            snapshot.data,
                            gaplessPlayback: true,
                            fit: BoxFit.contain,
                          );
                        } else {
                          return Image.memory(
                            _editedImage.readAsBytesSync(),
                            gaplessPlayback: true,
                            fit: BoxFit.contain,
                          );
                        }
                      },
                    ))
                  : Container(
                      child: _editedImage != null
                          ? Image.file(_editedImage)
                          : Image.network(
                              APIConstants.pi_95_PRI_213_PRCI_805_Items.length >
                                      0
                                  ? APIConstants.pi_95_PRI_213_PRCI_805_Items[0]
                                          .URLD5 +
                                      sasToken
                                  : "",
                              loadingBuilder: (c, w, b) {
                                APIConstants.pi_95_PRI_213_PRCI_805_Items
                                            .length >
                                        0
                                    ? UtilMethods.evictImage(
                                        "${APIConstants.pi_95_PRI_213_PRCI_805_Items[0].URLD5 + sasToken}")
                                    : null;
                                if (b == null) {
                                  return w;
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator(
                                          value: b.expectedTotalBytes != null
                                              ? b.cumulativeBytesLoaded /
                                                  b.expectedTotalBytes
                                              : null));
                                }
                              },
                            ))),
      if (showBrightnessSlider)
        Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(children: [
                  Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text("Brightness",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))
                ]),
                Slider(
                  value: _currentBrightnessValue,
                  min: -255,
                  max: 255,
                  onChanged: (double value) async {
                    if (mounted) {
                      setState(() {
                        _currentBrightnessValue = value;
                      });
                    }
                    var retorno = await PictureEditor.editImage(
                        _editedImage.readAsBytesSync(),
                        _currentContrastValue,
                        _currentBrightnessValue);
                    _pictureStream.add(retorno);
                  },
                ),
                Row(children: [
                  Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text("Contrast",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))
                ]),
                Slider(
                  value: _currentContrastValue,
                  min: 0,
                  max: 10,
                  onChanged: (double value) async {
                    if (mounted) {
                      setState(() {
                        _currentContrastValue = value;
                      });
                    }
                    var retorno = await PictureEditor.editImage(
                        _editedImage.readAsBytesSync(),
                        _currentContrastValue,
                        _currentBrightnessValue);
                    _pictureStream.add(retorno);
                  },
                )
                //your elements here
              ],
            )),

      // ]),
      if (imageLoading)
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black26,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${loaderText}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: CircularProgressIndicator())
                ])),
      if (showBrightnessSlider)
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
                  color: Colors.black,
                  height: 70,
                  padding: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () async {
                              if (mounted) {
                                setState(() {
                                  showBrightnessSlider = false;
                                  _currentBrightnessValue = 0.0;
                                  _currentContrastValue = 1;
                                });
                              }
                            },
                            child: Text("Cancel",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 18))),
                        TextButton(
                            onPressed: () async {
                              await brightnessSave();
                            },
                            child: Text("Done",
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 18)))
                      ]))
            ])),
      if (GlobalState.apiLoading) PageDataLoader()
    ]);
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
                                              .CHILDREN[0]
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
                                          .CHILDREN[0]
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
                                          .CHILDREN[0]
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
                                          .CHILDREN[0]
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
