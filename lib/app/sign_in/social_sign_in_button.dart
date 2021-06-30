import 'package:flutter/material.dart';
import 'package:flutter_app/common_widget/Custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButtons{
  SocialSignInButton({
   @required String assetName,
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(assetName),
        Text(text,
        style: TextStyle(color:textColor, fontSize: 15.0),
        ),
        Opacity(
            opacity: 0.0,
            child: Image.asset(assetName)),
      ],
    ),
    color: color,
    onPressed: onPressed,
  );

}