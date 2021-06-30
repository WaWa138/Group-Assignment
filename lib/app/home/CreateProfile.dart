import 'dart:io';

import 'package:flutter/material.dart';


class CreateProfile extends StatefulWidget {
  // CreateProfile({Key Key}) : super(Key: Key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("Images/profile-user.png",
          alignment: Alignment.center,
          width: 250,
          height: 90,
        ),
      ), 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: ListView(
          children: <Widget>[
            nameTextField(),
            SizedBox(
              height: 20,
            ),
            genderTextField(),
            SizedBox(
              height: 20,
            ),
            dobField(),
            SizedBox(
              height: 20,
            ),
            bloodtypeTextField(),
            SizedBox(
              height: 20,
            ),
            heightField(),
            SizedBox(
              height: 20,
            ),
            weightField(),
            SizedBox(
              height: 20,
            ),
            specialnoteField(),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              )
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          labelText: "Name",
          helperText:"Name can't be empty",
          hintText: "Develepor"
      ),
    );
  }
  Widget genderTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              )
          ),
          labelText: "Gender",
          helperText: "Gender can't be empty",
          hintText: "Male / Female"
      ),
    );
  }
  Widget dobField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              )
          ),
          labelText: "Date of Birth",
          helperText: "dd/mm/yyyy",
          hintText: "01/01/2020"
      ),
    );
  }
  Widget bloodtypeTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              )
          ),
          labelText: "blood type",
          helperText: "blood type can't be empty",
          hintText: "Blood O"
      ),
    );
  }
  Widget heightField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              )
          ),
          labelText: "Height",
          helperText: "Height can't be empty",
          hintText: "170 cm"
      ),
    );
  }
  Widget weightField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              )
          ),
          labelText: "Weight",
          helperText: "Weight can't be empty",
          hintText: "75 Kg"
      ),
    );
  }
  Widget specialnoteField() {
    return TextFormField(
      maxLength: 4,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              )
          ),
          labelText: "Special note for doctor",
          //helperText: "Profesion can't be empty",
          hintText: "Have allergies to peanut (if nothing just say nothing)"
      ),
    );
  }
}
