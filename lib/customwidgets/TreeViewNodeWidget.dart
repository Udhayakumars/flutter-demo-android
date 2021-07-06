import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/RequestKeys.dart';
import 'package:MMLMobile/utils/Utils.dart';
/**
 * File: directory_widget.dart
 * Package:
 * Project: tree_view
 * Author: Ajil Oommen (ajil@altorumleren.com)
 * Description:
 * Date: 06 January, 2019 2:04 PM
 */

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;

class TreeViewNodeWidget extends StatelessWidget {
  final AppDatabase appDatabaseControl;
  final String directoryName;
  final int iconID;
  final int PGP;
  final List<RequestKeys> nodeRequestKeys;
  // final DateTime lastModified;
  final VoidCallback onPressedNext;

  TreeViewNodeWidget({
    @required this.appDatabaseControl,
    @required this.iconID,
    @required this.directoryName,
    this.nodeRequestKeys,
    this.PGP,
    this.onPressedNext,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Text(directoryName);

    Widget folderIcon = Row(mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.,
        children: [
          IconButton(
            icon: Image.asset(
              GlobalConfiguration().get("0023"),
            ),
            onPressed: () async {

              //  print("==================Node RequestKeys=========================");
              //  print(nodeRequestKeys.toString());
              //  await UtilMethods.eventTreeviewNodeRefresh(appDatabaseControl, context, nodeRequestKeys);
            },
          ),
          IconButton(
            icon: Image.asset(
              GlobalConfiguration().get("0002"),
              height: 28,
              width: 28,
            ),
            onPressed: null,
          )
        ]);

    IconButton expandButton = IconButton(
      icon: Icon(
        Icons.more_horiz_rounded,
        color: Colors.grey,
      ),
      onPressed: onPressedNext,
    );

    // Widget lastModifiedWidget = Text(
    //   Utils.getFormattedDateTime(dateTime: lastModified),
    // );

    return Card(
      child: ListTile(
        tileColor: Colors.grey[200],
        leading: folderIcon,
        title: titleWidget,
        // subtitle: lastModifiedWidget,
        trailing: this.PGP != null ? expandButton : null,
      ),
    );
  }
}
