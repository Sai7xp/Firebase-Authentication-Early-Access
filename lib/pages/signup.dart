import 'package:firebaseauth/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'home_page.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formkey = new GlobalKey<FormState>();

  String _email;
  String _password;

  checkFields() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  createUser() {
    if (checkFields()) {
      //Perform Login
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        print('Signed in ${user.uid}');
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed('/login');
      }).catchError((e) {
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //appBar: new AppBar(
        //title: new Text('Sign up'),
        //centerTitle: true,),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(25.0),
              child: new Form(
                key: formkey,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.fire, size: 145.0,
        color: Colors.orange,),
                    SizedBox(height: 30.0),
                    new TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'Email is blank' : null,
                      onSaved: (value) => _email = value,
                    ),
                    SizedBox(height: 15.0),
                    new TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      obscureText: true,
                      validator: (value) =>
                          value.isEmpty ? 'Password is blank' : null,
                      onSaved: (value) => _password = value,
                    ),
                    SizedBox(height: 15.0),
                    new Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.black,
                        elevation: 7.0,
                        child: MaterialButton(
                          minWidth: 500.0,
                          height: 40.0,
                          onPressed: createUser,
                          color: Colors.lightGreen,
                          child: Text(
                            'Signup',
                            style: new TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                    padding: EdgeInsets.fromLTRB(20,20, 40, 40),  
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).popAndPushNamed('/login');
                      },
                      icon: Icon(FontAwesomeIcons.arrowAltCircleLeft,color: Colors.red,),
                        iconSize: 40.0,
                    ),

                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}