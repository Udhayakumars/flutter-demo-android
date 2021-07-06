import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_configuration/global_configuration.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;

import 'package:global_configuration/global_configuration.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_state/gs.dart';

class MELBackButton extends StatefulWidgetGS {
  final AppDatabase database;
  final int PI;
  const MELBackButton({Key key, @required this.database,@required this.PI}) : super(key: key);

  @override
  _BackButtonState createState() => _BackButtonState();
}

// class _SampleState extends State<ImageView> {
class _BackButtonState extends State<MELBackButton> {
  AppDatabase appDatabase;
  @override
  void initState() {
    super.initState();
    // builder();
  }

  Future<AppDatabase> builder() async {
    return await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }


  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () async {
          AppDatabase database = widget.database != null ? widget.database :  await builder();
          UtilMethods.eventBack(database, context, widget.PI);
        });
  }
}
