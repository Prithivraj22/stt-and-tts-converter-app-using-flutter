import 'package:flutter/material.dart';
import 'package:speech_converter/entrypage.dart';
import 'entrypage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  String age = "";
  String dob = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[500],
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your name...',
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                validator: (value) {
                  if (value== null || value.isEmpty){
                    return 'Please fill the Field !';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your age...',
                ),
                onChanged: (value) {
                  setState(() {
                    age = value;
                  });
                },
                validator: (value) {
                  if (value== null || value.isEmpty){
                    return 'Please fill the Field !';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your date of birth...',
                ),
                onChanged: (value) {
                  setState(() {
                    dob = value;
                  });
                },
                validator: (value) {
                  if (value== null || value.isEmpty){
                    return 'Please fill the Field !';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                  hintText: 'Enter valid email id like as abc123@gmail.com...',
                ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                validator: (value) {
                  if (value== null || value.isEmpty){
                    return 'Please fill the Field !';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  hintText: 'Create a secure password...',
                ),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                validator: (value) {
                  if (value== null || value.isEmpty){
                    return 'Please fill the Field !';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EntryPage()));
                  },
                  child: Text('Create account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}