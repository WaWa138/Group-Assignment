import 'package:flutter/material.dart';
import 'package:flutter_app/app/home/models/user.dart';
import 'package:flutter_app/common_widget/custom_list_tile.dart';
class UserListTile extends StatelessWidget {
  const UserListTile({Key key, @required this.user}) : super(key: key);
  final Users user;
 // final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomListTile(
              icon: Icons.account_box,
              title: user.name,
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            CustomListTile(
              icon: Icons.visibility,
              title: user.gender,
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            CustomListTile(
              icon: Icons.bloodtype,
              title: user.bloodType,
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            CustomListTile(
              icon: Icons.height,
              title: user.height,
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            CustomListTile(
              icon: Icons.monitor_weight ,
              title: user.weight,
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            CustomListTile(
              icon: Icons.note_add,
              title: user.note,
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
