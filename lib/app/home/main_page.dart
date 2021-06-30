
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:url_launcher/url_launcher.dart';

String url= 'tel:999';
String _locationMessage = "";
String defaultMessage="Help needed at this location:";
List<String> recipents = ["0127872144", "0123456789"];
final myController = TextEditingController();

void MainPage() => runApp(new App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();

}

class _AppState extends State<App> {
  //@override

 // const _AppState({Key key, @required this.database, this.contacts}) : super(key: key);
  //final Database database;
 // final Contacts contacts;

  void _getLocation() async{
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _locationMessage ="${position.latitude}, ${position.longitude}";
    });

  }


  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen:false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }


  //Future<void> _settings(BuildContext context) async {
 //   Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(database: database)));
 // }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ElertS', style: TextStyle(fontSize: 25),),
        centerTitle: true,
        actions: [
          FlatButton(
            child:
            Icon(Icons.local_phone_rounded,
                  size: 40,
                  color: Colors.white,),
          //  color: Colors.white,


            onPressed:() => callnow(),

          ),
        ],
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
     // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    //  floatingActionButton: FloatingAction(),
     );
  }



  Widget _buildContent() {

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: () => _getLocation(),
              child: const Text('Set location', style: TextStyle(fontSize: 20)),
              color: Colors.green,
              textColor: Colors.white,
              elevation: 5,
            ),
            Text(
                'After pressing the emergency button, we will send your alert message to your contacts',
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
                textAlign: TextAlign.center
            ),
            SizedBox(height:30.0),

            ClipOval(
              child: Material(
                color: Colors.white,
                child: InkWell(
                  splashColor: Colors.red,
                  child: SizedBox(width: 250, height: 400, child: Image.asset('images/circleambulance.png')),
                  onTap: () {
                    _sendSMS(myController.text, recipents, _locationMessage, defaultMessage);
                  },
                ),
              ),
            ),
            SizedBox(height:30.0),

            new TextFormField(
              controller: myController,
              decoration: new InputDecoration(
                labelText: "Type your message here",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(
                  ),
                ),
                //fillColor: Colors.green
              ),
              validator: (val) {
                if(val.length==0) {
                  return "Type text here";
                }else{
                  return null;
                }
              },
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }


}




void _sendSMS(String message, List<String> recipents, String _locationMessage, String defaultMessage) async {

  String _result = await sendSMS(message: ('$message $defaultMessage $_locationMessage'), recipients:recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}

Future<void> callnow() async{
  if(await canLaunch(url))
  {
    await launch(url);
  }else
  {
    throw 'call not possible';
  }
}

class FloatingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(bottom:70),
          child: FloatingActionButton(
            onPressed: () => callnow(),
            child: Icon(Icons.phone),
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}