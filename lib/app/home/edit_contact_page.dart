import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/home/models/contacts.dart';
import 'package:flutter_app/common_widget/show_exception_alert_dialog.dart';
import 'package:flutter_app/services/database.dart';
import 'package:provider/provider.dart';

class EditContactPage extends StatefulWidget {
  const EditContactPage({Key key, @required this.database, this.contacts}) : super(key: key);
  final Database database;
  final Contacts contacts;

  static Future <void> show(BuildContext context, {Contacts contacts}) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditContactPage(database: database, contacts: contacts),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {

  final _formKey = GlobalKey<FormState>();

  String _name;
  String _phoneNo;

  @override
  void initState(){
    super.initState();
    if(widget.contacts != null){
      _name = widget.contacts.name;
      _phoneNo = widget.contacts.phoneNo;
    }
  }

  bool _validateAndSaveForm(){
    final form = _formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
      return false;
  }
  Future<void> _submit() async{
      if (_validateAndSaveForm()){
        try {
       final contacts = Contacts(name: _name, phoneNo: _phoneNo);
       await widget.database.addContacts(contacts);
       Navigator.of(context).pop();
      } on FirebaseException catch (e){
          showExceptionAlertDialog(
            context,
            title: 'Operation failed',
            exception: e,
          );
        }

      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(widget.contacts == null ? 'New Contact':'Edit Contact'),
        actions: <Widget>[
          FlatButton(
            child: Text('Save', style: TextStyle(fontSize: 18, color: Colors.white),),
          onPressed: _submit,
          )
        ],
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget>_buildFormChildren() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Contact\'s Name'),
        initialValue: _name,
        validator: (value) => value.isNotEmpty ? null: 'Name can\'t be empty',
        onSaved: (value) => _name =value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Phone Number'),
        initialValue: '$_phoneNo',
        keyboardType: TextInputType.numberWithOptions(
            signed: false,
            decimal: false
        ),
        onSaved: (value) => _phoneNo = value,
      ),

    ];
  }
}

