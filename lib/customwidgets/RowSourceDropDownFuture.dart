import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/RowItem.dart';
import 'package:MMLMobile/models/RowSources.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_configuration/global_configuration.dart';

class RowSourceDropDownFuture extends StatelessWidget {

  RowSourceDropDownFuture({Key key, this.configValue}) : super(key: key);
  final String configValue;
  RowItem _rowItem;

  @override
  Widget build(BuildContext context) {
    print(configValue);
    return Container(
      child: new DropdownButton<RowItem>(
        isExpanded: true,
        hint: new Text('RS_1_10_2'),
        value: _rowItem == null ? null : _rowItem,
        items: (APIConstants.responseBody.jsonOutput_RowSources.length > 0 ? APIConstants.responseBody.jsonOutput_RowSources.elementAt(0)
            .RS_1_10_2 : new List<RowSources>())
            .map((dynamic value) {
          return new DropdownMenuItem<RowItem>(
            value: value,
            child: new Text(
              value.D.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
        onChanged: (dynamic newValue) {
          // setState(() {
          //   _rowItem = newValue;
          // });
        },
      ),

    );
  }
}