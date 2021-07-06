import 'dart:convert';

import 'package:MMLMobile/models/ResponseBody.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/Rkeys.dart';
import 'package:MMLMobile/models/RowItem.dart';
import 'package:MMLMobile/models/RowSources.dart';
import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:global_configuration/global_configuration.dart';
import 'package:toast/toast.dart';

class SearchScreen extends StatefulWidget {
  final ResponseBody recents;

  const SearchScreen({Key key, this.recents}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}



class _SearchScreenState extends State<SearchScreen> {
  RowItem _rowItem;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        body: new Column(
          children: <Widget>[

            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child:   Center(child: Icon(Icons.search)),
              ),
            ),


          ],
        ));

  }
}

