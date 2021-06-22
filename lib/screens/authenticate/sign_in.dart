import 'package:brew_crew_new/services/auth.dart';
import 'package:brew_crew_new/utils/utils.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email = "";
  String _password = "";
  String error ='';

  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Brew Crew  -  Sign in'),
        actions: [
          TextButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign-up')
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
        child: Center(
          // child: ElevatedButton(
          //   onPressed: () async {
          //     dynamic result = await _auth.signInAnon();
          //     if (result == null) {
          //       print('Error Signing in');
          //     } else {
          //       print('Sign in Succesful : ${result.uid}');
          //     }
          //   },
          //   child: Text('Sign-in Anon'),
          //   style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all(Colors.brown),
          //       padding: MaterialStateProperty.all(
          //           EdgeInsets.symmetric(horizontal: 30, vertical: 20))),
          // ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField (
                  decoration: customInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter Email' : null,
                  onChanged: (val) {
                    setState(() {
                      _email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField (
                  decoration: customInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) => val.length < 6 ? 'Enter password having more than 6 characters' : null,
                  onChanged: (val) {
                    _password = val;
                  },
                ),
                SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                    onPressed: () async{
                      if(_formKey.currentState.validate()){
                        dynamic  result = await _auth.signInWithEmailAndPassword(_email, _password);
                        if(result == null){
                          setState(() {
                            print('Failure Signing in');
                            error = 'Enter correct email or password';
                          });
                        }else{
                          setState(() {
                            print('Successfully Signed in');
                          });
                        }
                      }
                    },
                    child: Text('Sign in '))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
