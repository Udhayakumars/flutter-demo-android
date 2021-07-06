import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:convert';

import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/organization/PI_97_PRI_215_PRCI_807_Items.dart';
import 'package:MMLMobile/screens/navigation/organization/core/FilmStripEdit.dart';
import 'package:MMLMobile/screens/navigation/videoTrimmer/trim_editor.dart';
import 'package:MMLMobile/screens/navigation/videoTrimmer/trimmer.dart';
import 'package:MMLMobile/screens/navigation/videoTrimmer/video_viewer.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:global_state/gs.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:intl/intl.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/Preference.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;

// class HomePage extends StatelessWidget {
//   final Trimmer _trimmer = Trimmer();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Video Trimmer"),
//       ),
//       body: Center(
//         child: Container(
//           child: RaisedButton(
//             child: Text("LOAD VIDEO"),
//             onPressed: () async {
//               File file = await ImagePicker.pickVideo(
//                 source: ImageSource.gallery,
//               );
//               if (file != null) {
//                 await _trimmer.loadVideo(videoFile: file);
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) {
//                   return TrimmerView(_trimmer);
//                 }));
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class TrimmerView extends StatefulWidgetGS {
  final Trimmer trimmer;

  const TrimmerView({Key key, this.trimmer}) : super(key: key);

  @override
  _TrimmerViewState createState() => _TrimmerViewState();
}

class _TrimmerViewState extends State<TrimmerView> {
  double _startValue = 1000;
  double _endValue = 0;

  bool _isPlaying = false;
  bool _progressVisibility = false;

  Trimmer trimmer;

  bool apiLoading = false;

  Timer timer;

  String progress = "0";
  AppDatabase database;

  @override
  void initState() {
    if (widget.trimmer != null) {
      setState(() {
        trimmer = widget.trimmer;
      });
    }

    builder();
    getSAS_token();

    // loadPageData();
    super.initState();
  }

  builder() async {
    database = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  bool downloading = false;
  bool isDownloaded = false;

  String sasToken = null;
  getSAS_token() async {
    await Preference.getItem("SAS_Token").then((value) => {
          setState(() {
            sasToken = value;
          })
        });
  }

  // loadPageData() async {
  //   timer = Timer.periodic(new Duration(seconds: 3), (timer) async {
  //     if (timer.tick == 5) {
  //       timer.cancel();
  //     }
  //     if (APIConstants.pi_97_PRI_215_PRCI_807_Items.length != 0) {
  //       timer.cancel();
  //
  //       var dio = Dio();
  //
  //       final Directory appDirectory = await getApplicationDocumentsDirectory();
  //       final String videoDirectory = '${appDirectory.path}/Videos';
  //       await Directory(videoDirectory).create(recursive: true);
  //       final String currentTime =
  //           DateTime.now().millisecondsSinceEpoch.toString();
  //       final String filePath = '$videoDirectory/${currentTime}.mp4';
  //       print(filePath);
  //
  //       downloading = true;
  //       dio.download(
  //         APIConstants.pi_97_PRI_215_PRCI_807_Items[0].tvpStorageItemsEditing[0]
  //                 .strStorageItemsUrlDerivative10 +
  //             sasToken,
  //         filePath,
  //         onReceiveProgress: (rcv, total) {
  //           setState(() {
  //             progress = ((rcv / total) * 100).toStringAsFixed(0);
  //           });
  //         },
  //         deleteOnError: true,
  //       ).then((_) async {
  //         setState(() {
  //           downloading = false;
  //         });
  //         final file = new File(filePath);
  //         trimmer = new Trimmer();
  //         await trimmer.loadVideo(videoFile: file).whenComplete(() => null);
  //       });
  //     }
  //   });
  // }

  Future<String> _saveVideo() async {
    setState(() {
      _progressVisibility = true;
    });

    String _value;

    print("IN Point");
    print(_startValue);
    print("Out Point");
    print(_endValue);

    await trimmer
        .saveTrimmedVideo(
            startValue: _startValue,
            endValue: _endValue,
            videoFolderName: "trimmer",
            videoFileName:
                "Mobile_Video_${DateFormat('yyyy-MM-dd_hh:mm:ss').format(DateTime.now().toLocal())}")
        .then((value) {
      setState(() {
        _progressVisibility = false;
        _value = value;
        print(_value);
      });
    });

    return _value;
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () async {
                print("callingEventBack");
                print("callingEventBack");
                UtilMethods.eventBack(database, context, 95);
                // Navigator.of(context).pop();
              },
              child: IconButton(
                  icon: Icon(Icons.arrow_back), color: Colors.black87),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Video trim",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Stack(children: [
          trimmer == null || apiLoading
              ? Center(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      if (apiLoading)
                        Text("Saving your changes",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: CircularProgressIndicator())
                    ]))
              : Builder(
                  builder: (context) => Center(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 30.0),
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Visibility(
                            visible: _progressVisibility,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.red,
                            ),
                          ),
                          RaisedButton(
                            onPressed: _progressVisibility
                                ? null
                                : () async {
                                    if (GlobalState.PRI == 215) {
                                      List<JsonStorageItemsTransformationsChildren>
                                          jsonStorageItemsTransformationsChildren;
                                      if (APIConstants
                                              .pi_97_PRI_215_PRCI_807_Items
                                              .length >
                                          0) {
                                        if (APIConstants
                                                .pi_97_PRI_215_PRCI_807_Items[0]
                                                .tvpStorageItemsEditing
                                                .length >
                                            0) {
                                          if (APIConstants
                                                  .pi_97_PRI_215_PRCI_807_Items[
                                                      0]
                                                  .tvpStorageItemsEditing[0]
                                                  .jsonStorageItemsTransformations
                                                  .length >
                                              0) {
                                            jsonStorageItemsTransformationsChildren =
                                                APIConstants
                                                    .pi_97_PRI_215_PRCI_807_Items[
                                                        0]
                                                    .tvpStorageItemsEditing[0]
                                                    .jsonStorageItemsTransformations[
                                                        0]
                                                    .jsonStorageItemsTransformationsChildren;
                                          }
                                        }
                                      }
                                      Map<String, dynamic> bodyDataCustom = {};
                                      if (jsonStorageItemsTransformationsChildren !=
                                          null) {
                                        int startIndex =
                                            jsonStorageItemsTransformationsChildren
                                                .indexWhere((element) =>
                                                    element
                                                        .intStorageItemsTransformationsTypeID ==
                                                    4);
                                        int stopIndex =
                                            jsonStorageItemsTransformationsChildren
                                                .indexWhere((element) =>
                                                    element
                                                        .intStorageItemsTransformationsTypeID ==
                                                    5);
                                        if (startIndex != -1 &&
                                            stopIndex != -1) {
                                          jsonStorageItemsTransformationsChildren[
                                                  startIndex]
                                              .dblData1 = _startValue;
                                          jsonStorageItemsTransformationsChildren[
                                                  stopIndex]
                                              .dblData1 = _endValue;
                                        }
                                        bodyDataCustom = {
                                          "ClientDataJson": {
                                            "jDT": [
                                              {
                                                "PRCI": 820,
                                                "DT": {
                                                  "jsonStorageItemsTransformations_Children":
                                                      jsonStorageItemsTransformationsChildren
                                                          .map(
                                                              (e) => e.toJson())
                                                          .toList(),
                                                  "ND": true
                                                }
                                              }
                                            ]
                                          }
                                          // "ImageIndex": imageIndex,
                                        };
                                      }

                                      setState(() {
                                        apiLoading = true;
                                      });
                                      await UtilMethods.eventSave(database,
                                          context, 244, bodyDataCustom);
                                      setState(() {
                                        apiLoading = false;
                                      });
                                      UtilMethods.eventBack(database, context, 95);
                                    } else {
                                      String outputPath = await _saveVideo();
                                      File file = File(outputPath);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return ThingsImageEdit(file: file);
                                      }));
                                    }
                                  },
                            child: Text("SAVE"),
                          ),
                          Expanded(
                            child: VideoViewer(),
                          ),
                          Center(
                            child: TrimEditor(
                              defaultStartValue: _startValue,
                              defaultEndValue: _endValue,
                              viewerHeight: 100.0,
                              viewerWidth: MediaQuery.of(context).size.width,
                              onChangeStart: (value, startPos, endPos) {
                                _startValue = value;
                                print("Start Value");
                                print(_startValue);
                                // _setVideoPosition(startPos, endPos);
                              },
                              onChangeEnd: (value, startPos, endPos) {
                                _endValue = value;
                                print("End Value");
                                print(_endValue);
                                // _setVideoPosition(startPos, endPos);
                              },
                              onChangePlaybackState: (value) {
                                setState(() {
                                  _isPlaying = value;
                                });
                              },
                            ),
                          ),
                          FlatButton(
                            child: _isPlaying
                                ? Icon(
                                    Icons.pause,
                                    size: 80.0,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.play_arrow,
                                    size: 80.0,
                                    color: Colors.white,
                                  ),
                            onPressed: () async {
                              bool playbackState =
                                  await trimmer.videPlaybackControl(
                                startValue: _startValue,
                                endValue: _endValue,
                              );
                              setState(() {
                                _isPlaying = playbackState;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
          if(GlobalState.apiLoading) PageDataLoader()
        ]));
  }
}
