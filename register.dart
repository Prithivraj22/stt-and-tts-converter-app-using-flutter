import 'package:flutter/material.dart';
import 'package:speech_converter/entrypage.dart';
import 'login.dart';
import 'entrypage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        top: true,
        child:Registerpage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Registerpage extends StatefulWidget {
  @override
  State<Registerpage> createState() => RegisterpageState();
}

class RegisterpageState extends State<Registerpage> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.grey[900],

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your user email id like as abc123@gmail.com...',
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
                SizedBox(height: 20.0),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Password...',
                  ),
                  obscureText: true,
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
                    // child: Text('Already Registered...'),
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30,110,30,0),
            child: Center(child: Text('Are you are a New user ?')),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text('Create account'),
          ),
        ],

      ),

    );
  }
}

