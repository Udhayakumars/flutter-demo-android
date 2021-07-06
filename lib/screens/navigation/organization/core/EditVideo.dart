import 'dart:async';
import 'dart:io';

import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/screens/navigation/NavigationCalls.dart';
import 'package:MMLMobile/screens/navigation/videoTrimmer/trimmer.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:global_configuration/global_configuration.dart';
import 'package:path_provider/path_provider.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;

import 'VideoTrimmer.dart';

class EditVideo extends StatefulWidget {
  @override
  _EditVideoState createState() => _EditVideoState();
}

class _EditVideoState extends State<EditVideo> {
  AppDatabase appDatabase;
  int locationsPagePI = 95;

  Timer timer;
  bool downloading = false;
  bool isDownloaded = false;
  String progress = "0";

  @override
  void initState() {
    builder();
    getSAS_token();
    loadPageData();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void deactivate() {
    timer.cancel();
    super.deactivate();
  }

  String sasToken = null;
  getSAS_token() async {
    await Preference.getItem("SAS_Token").then((value) => {
          setState(() {
            sasToken = value;
          })
        });
  }

  loadPageData() async {
    timer = Timer.periodic(new Duration(seconds: 3), (timer) async {
      if (timer.tick == 5) {
        timer.cancel();
      }
      if (APIConstants.pi_97_PRI_215_PRCI_807_Items.length != 0) {
        timer.cancel();

        var dio = Dio();

        final Directory appDirectory = await getApplicationDocumentsDirectory();
        final String videoDirectory = '${appDirectory.path}/Videos';
        await Directory(videoDirectory).create(recursive: true);
        final String currentTime =
            DateTime.now().millisecondsSinceEpoch.toString();
        final String filePath = '$videoDirectory/${currentTime}.mp4';

        downloading = true;
        print(APIConstants.pi_97_PRI_215_PRCI_807_Items[0].tvpStorageItemsEditing[0].strStorageItemsUrlDerivative10 +
            sasToken);
        dio.download(
          APIConstants.pi_97_PRI_215_PRCI_807_Items[0].tvpStorageItemsEditing[0].strStorageItemsUrlDerivative10 +
              sasToken,
          filePath,
          onReceiveProgress: (rcv, total) {
            setState(() {
              progress = ((rcv / total) * 100).toStringAsFixed(0);
            });
          },
          deleteOnError: true,
        ).then((_) async {
          setState(() {
            downloading = false;
          });
          final file = new File(filePath);
          final trimmer = new Trimmer();
          await trimmer.loadVideo(videoFile: file);
          // await trimmer.videPlaybackControl(startValue: 48.3, endValue: 399.0);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return TrimmerView(trimmer: trimmer);
          }));
        });
      }
    });
  }

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
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
                UtilMethods.eventBack(appDatabase, context, 95);
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
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              if (downloading) Text("Downloading $progress %"),
              Padding(child:CircularProgressIndicator(),
              padding: EdgeInsets.all(16.0),)
            ])));
  }
}
