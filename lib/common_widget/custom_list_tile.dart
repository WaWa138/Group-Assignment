import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final  title;
  CustomListTile({this.icon, this.text, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            "$title",
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}