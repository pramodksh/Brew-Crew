import 'package:brew_crew_new/screens/authenticate/sign_in.dart';
import 'package:brew_crew_new/screens/authenticate/sign_up.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = false;
  void toggleView(){
    setState(() {
      return showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView : toggleView);
    }else{
      return SignUp(toggleView : toggleView);
    }
  }
}
