import 'package:meta/meta.dart';

class Users{
  Users({ @required this.name,@required this.gender,@required this.date,@required this.bloodType,@required this.height, @required this.weight,@required this.note});

  final String name;
  final String gender;
  final String date;
  final String bloodType;
  final String height;
  final String weight;
  final String note;



  factory Users.fromMap(Map<String, dynamic> data){
    if (data == null){
      return null;
    }
    final String name = data['name'];
    final String gender = data['gender'];
    final String date = data['date'];
    final String bloodType = data['bloodType'];
    final String height = data['height'];
    final String weight = data['weight'];
    final String note = data['note'];

    return Users(
        name: name,
        gender: gender,
        date: date,
        bloodType: bloodType,
        height: height,
        weight: weight,
        note: note,
    );
  }

  Map <String, dynamic> toMap(){
    return {
      'name' : name,
      'gender':gender,
      'date' : date,
      'bloodType':bloodType,
      'height' : height,
      'weight':weight,
      'note':note,
    };
  }
}