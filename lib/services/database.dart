
import 'package:flutter_app/services/firestore_services.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/app/home/models/contacts.dart';
import 'package:flutter_app/services/api_path.dart';

abstract class Database {
  Future<void> addContacts(Contacts contacts);
  Stream<List<Contacts>> contactsStream() ;
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreServices.instance;

  Future<void> addContacts(Contacts contacts) =>
      _service.setData(
        path: APIPath.contact(uid, documentIdFromCurrentDate()),
        data: contacts.toMap(),
      );

  Stream<List<Contacts>> contactsStream() => _service.collectionStream(
      path: APIPath.contacts(uid),
      builder: (data) => Contacts.fromMap(data),
  );


}