import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class splash extends StatefulWidget {
  splash({Key key}) : super(key: key);

  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((user){
      if(user == null){
        Timer(Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, "/login"));
      }
      else{
         Timer(Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, "/home"));
      }
    });
    super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Material(
      
      child: Center(
        child: Icon(FontAwesomeIcons.bolt,size: 145.0,
        color: Colors.lightGreen,),
        
      ),
    );
  }
}
