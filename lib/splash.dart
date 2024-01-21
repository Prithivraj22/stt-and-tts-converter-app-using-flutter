import 'package:flutter/material.dart';
import 'dart:async';
import 'entrypage.dart';

void main() {
  runApp(Spalsh());
}

class Spalsh extends StatelessWidget {
  const Spalsh({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpalshScreen(),
    );
  }
}

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {


  @override
  void initState(){
    super.initState();
    Timer(
      const Duration(seconds: 4), () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => EntryPage1())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child:Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/icon/icon.jpg'))
              ),
            )
          ],
        )
      )
    )
      )
    );
  }
}

