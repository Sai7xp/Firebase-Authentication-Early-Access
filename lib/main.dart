import 'package:firebaseauth/pages/splash.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/pages/login.dart';
import 'package:firebaseauth/pages/signup.dart';
import 'package:firebaseauth/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      color: Colors.deepOrange,
      theme: ThemeData(primarySwatch: Colors.lightGreen,fontFamily: 'Mont'),
      home: splash(),
      routes: <String, WidgetBuilder>{
        '/login' : (BuildContext context) => new Login(),
        '/signup' : (BuildContext context) => new Signup(),
        '/home' : (BuildContext context) => new home(),
        '/splash' : (BuildContext context) => new splash(),
      }
    );
    }
  }