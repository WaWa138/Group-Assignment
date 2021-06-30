
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/home/settings_page.dart';
import 'package:flutter_app/common_widget/show_alert_dialog.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sms/flutter_sms.dart';

List<String> recipents = ["9876543210", "8765432190"];

class HomePage extends StatelessWidget {
  @override

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen:false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async{
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to log out?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if(didRequestSignOut == true){
      _signOut(context);
    }
  }


  Future<void> _settings(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(icon: Icon(Icons.menu),
            onPressed: () => _settings(context),
          ),
          FlatButton(
            child:
            Text('Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),

            onPressed:() => _confirmSignOut(context),

          ),
        ],
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }



  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // SizedBox(height: 48.0),
          // on_CallButton(
          // assetName: 'images/but.png',
          //text: 'Profile',
          // textColor: Colors.black87,
          //color: Colors.white,
          // onPressed: () {},
          // ),
          ClipOval(
            child: Material(
              color: Colors.white,
              child: InkWell(
                splashColor: Colors.red,
                child: SizedBox(width: 250, height: 400, child: Image.asset('images/circleambulance.png')),
                onTap: () {
                  _sendSMS("This is a test message!", recipents);
                },
              ),
            ),
          ),
          Text(
              'After pressing the emergency button, we will send your alert message to your contacts',
              textAlign: TextAlign.center
          ),
        ],
      ),
    );
  }
}

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
