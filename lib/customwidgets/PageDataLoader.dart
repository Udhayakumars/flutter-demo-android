import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_configuration/global_configuration.dart';

class PageDataLoader extends StatelessWidget {
  PageDataLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black26,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("Preparing Page Data..",
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold)),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CircularProgressIndicator())
            ]));
  }
}
