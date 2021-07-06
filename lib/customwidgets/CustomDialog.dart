import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UIConstants.dart' as UIConstants;

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIConstants.padding),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }



  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[

        Container(
          padding: EdgeInsets.only(
            top: UIConstants.avatarRadius + UIConstants.padding,
            bottom: UIConstants.padding,
            left: UIConstants.padding,
            right: UIConstants.padding,
          ),
          margin: EdgeInsets.only(top: UIConstants.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(UIConstants.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: UIConstants.padding,
          right: UIConstants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.amberAccent,
            radius: UIConstants.avatarRadius,
            child: new Container(
              margin: EdgeInsets.only(top: UIConstants.padding, bottom: UIConstants.padding),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/logotemp.png"),
                ),

              ),),
          ),

        ),

      ],
    );
  }
}