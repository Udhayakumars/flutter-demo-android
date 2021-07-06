import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_configuration/global_configuration.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;

import 'package:global_configuration/global_configuration.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_state/gs.dart';

class ExpandedText extends StatefulWidgetGS {
  final bool showFullText;
  final String textString;
  final VoidCallback onTapFunc;
  const ExpandedText(
      {Key key,
      @required this.showFullText,
      @required this.textString,
      @required this.onTapFunc})
      : super(key: key);

  @override
  _ExpandedTextState createState() => _ExpandedTextState();
}

// class _SampleState extends State<ImageView> {
class _ExpandedTextState extends State<ExpandedText> {
  Widget _getTextWidget() {
    if (!widget.showFullText) {
      return Container(
          width: (MediaQuery.of(context).size.width / 2) - 14,
          child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "${widget.textString}",
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: TextStyle(fontSize: 17, color: Colors.black),
              )));
    }
    if (widget.showFullText) {
      return Expanded(
// width: (MediaQuery.of(context).size.width / 2) - 40,
          child: Text(
        "${widget.textString}",
        style: TextStyle(
            fontSize: 17,
// fontWeight: FontWeight.bold,
            color: Colors.black),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: (MediaQuery.of(context).size.width / 2 + 10),
        child: Align(
          alignment: Alignment.topRight,
          child: Row(children: [
            _getTextWidget(),
            GestureDetector(
                onTap: widget.onTapFunc,
                child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(!widget.showFullText
                        ? Icons.arrow_circle_down_sharp
                        : Icons.arrow_circle_up_sharp))),
          ]),
        ));
  }
}
