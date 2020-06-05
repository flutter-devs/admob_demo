import 'package:firebase_demo/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('sign in to brewdfv'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RaisedButton(
            child: Text('Sign in Annon'),
            onPressed: () async {
              dynamic result = await auth.signInAnon();

              if (result == null) {
                print("errror singin in");
              } else {
                print("Signed In ");
                print(result);

              }
            }),
      ),
    );
  }
}
