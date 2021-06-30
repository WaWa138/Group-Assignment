
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/home/contact_list_file.dart';
import 'package:flutter_app/app/home/edit_contact_page.dart';
import 'package:flutter_app/app/home/models/contacts.dart';
import 'package:flutter_app/common_widget/show_alert_dialog.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/app/home/settings_page.dart';

class ContactPage extends StatelessWidget
{
  @override





  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Lists'),


      ),
      body: contactView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => EditContactPage.show(context),
      ),
    );
  }


//Widget _buildContents(BuildContext context) {
//   final database = Provider.of<Database>(context, listen:false);
//  return StreamBuilder<List<Contacts>>(
//    stream: database.contactsStream(),
//   builder: (context, snapshot){
//    if (snapshot.hasData){
//      final contacts = snapshot.data;
//      final children = contacts
//          .map((contacts) => ContactListTile(
//        contacts: contacts,
//        onTap: () => EditContactPage.show(context, contacts: contacts),
//       ))
//          .toList();
//     return ListView(children: children);
//     }
//     if (snapshot.hasError){
//        return Center(child: Text('Some error occured'));
//     }
//      return Center(child: CircularProgressIndicator());
//   },
//  );
//}
}

class contactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen:false);
    return StreamBuilder<List<Contacts>>(
      stream: database.contactsStream(),
      builder: (context, snapshot){
        if (snapshot.hasData){
          final contacts = snapshot.data;
          final children = contacts
              .map((contacts) => ContactListTile(
            contacts: contacts,
            onTap: () => EditContactPage.show(context, contacts: contacts),
          ))
              .toList();
          return ListView(children: children);
        }
        if (snapshot.hasError){
          return Center(child: Text('Some error occured'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
