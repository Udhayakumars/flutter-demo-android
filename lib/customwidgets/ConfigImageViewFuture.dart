import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_configuration/global_configuration.dart';

class ConfigImageViewFuture extends StatelessWidget {

  ConfigImageViewFuture({Key key, this.configValue}) : super(key: key);
  final String configValue;

  @override
  Widget build(BuildContext context) {
    print(configValue);
    return Container(
      child: GlobalConfiguration().get(this.configValue) != null
          ? Image.asset(
          GlobalConfiguration().get(this.configValue),
          height: 100,
          width: 100)
          : Image.asset(
          GlobalConfiguration().get("1595"),
          height: 100,
          width: 100),
    );
  }
}