import 'package:meta/meta.dart';

class Contacts{
  Contacts({@required this.name, @required this.phoneNo});
  final String name;
  final String phoneNo;

  factory Contacts.fromMap(Map<String, dynamic> data){
    if (data == null){
      return null;
    }
    final String name = data['name'];
    final String phoneNo = data['phoneNo'];
    return Contacts(
        name: name,
        phoneNo: phoneNo
    );
  }

Map <String, dynamic> toMap(){
  return {
    'name' : name,
    'phoneNo':phoneNo,
    };
  }
}