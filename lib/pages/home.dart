import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';
void main() => runApp(home());

class home extends StatefulWidget {
  home({Key key}) : super(key: key);

  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  Future<bool> _onWillPop(){
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: Text('Please Confirm',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        content: Text('Are you sure to exit the app?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          )
        ],
      ),
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
    child: Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        centerTitle: true,
        elevation: 5.0,
      ),
      drawer: new Drawer(
        elevation: 5.0
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Inpired by MrNullPointer nd finally done',style: Theme.of(context).textTheme.subtitle.apply(
                  color: Colors.black,fontSizeDelta: 0.6),),
              SizedBox(
                height: 30.0,
              ),
              //Image.asset('assets/mohan.png'),
              CircleAvatar(
                backgroundImage: new AssetImage('assets/mohan.png'),
                radius: 80.0,
                backgroundColor: Colors.transparent,

              ),
              SizedBox(
                height: 20.0,
              ),
              OutlineButton(
                onPressed: (){
                  FirebaseAuth.instance.signOut().then((action){
                    Navigator.of(context).pushReplacementNamed('/login');
                  }).catchError((e){
                    print(e);
                  });
                },
                borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 4.0),
                child: Text('Let me go out'),
              ),
              SizedBox(height: 20.0,),

            ],
          ),
        ),
      ),
    )
    );
  }
}