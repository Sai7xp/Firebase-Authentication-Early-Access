import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
  loginUser() {
    if (checkFields()) {
      //Perform Login
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        print('Signed in as ${user.uid}'); 
         Navigator.of(context).pushReplacementNamed('/home');
      }).catchError((e) {
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
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
                    Icon(FontAwesomeIcons.fire, size: 135.0,
                       color: Colors.orange,),
                    SizedBox(height: 29.0),
                    new TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.mail),
                        
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
                        prefixIcon: Icon(Icons.vpn_key),
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
                        elevation: 8.0,
                        child: MaterialButton(
                          minWidth: 500.0,
                          height: 40.0,
                          onPressed: loginUser,
                          color: Colors.lightGreen,
                          child: Text(
                            'Log In',
                            style: new TextStyle(color: Colors.white,fontFamily: 'Mont'),
                          ),
                        ),
                      ),
                    ),
                    new Text('Don\'t have an account? ',style: TextStyle(fontSize: 16.0,fontFamily: 'Mont',),),
                    new Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.black,
                        elevation: 8.0,
                        child: MaterialButton(
                          minWidth: 500.0,
                          height: 40.0,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/signup');
                          },
                          color: Colors.lightGreen,
                          child: Text(
                            'Signup',
                            style: new TextStyle(color: Colors.white),
                          ),
                        ),
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