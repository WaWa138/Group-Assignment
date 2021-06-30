import 'package:flutter/material.dart';
import 'package:flutter_app/app/home/models/contacts.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile({Key key, @required this.contacts, this.onTap}) : super(key: key);
  final Contacts contacts;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contacts.name),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
