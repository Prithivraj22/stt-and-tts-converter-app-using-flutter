import 'package:flutter/material.dart';
import 'package:speech_converter/tts.dart';

import 'main.dart';

class EntryPage1 extends StatelessWidget {
  const EntryPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EntryPage(),
    );
  }
}

class  EntryPage extends StatefulWidget {
  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(

      appBar: AppBar(
        title: Center(child: const Text('Voice assistant')),
        backgroundColor: Colors.grey[900],
      ),
          backgroundColor:Colors.grey[800],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                textStyle: TextStyle(
                  fontSize: 20,
                )
              ),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Speech_text()));
            },
        child: Text('Speech to Text'),

            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                  textStyle: TextStyle(
                    fontSize: 20,
                  )
              ),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
            },
              child: Text('Text to Speech'),
            ),
          ],
        ),
      ),
        )
    );
  }
}

