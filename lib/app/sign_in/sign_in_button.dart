import 'package:flutter/material.dart';
import 'package:flutter_app/common_widget/Custom_raised_button.dart';

class SignInButton extends CustomRaisedButtons{
  SignInButton({
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
}) : assert(text != null),
        super(
    child: Text(text, style: TextStyle(color: textColor, fontSize: 15.0)
    ),
    color: color,
    onPressed: onPressed, 
  );
  
}