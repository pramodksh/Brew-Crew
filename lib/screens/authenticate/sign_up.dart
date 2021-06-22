// import 'package:brew_crew_new/services/auth.dart';
import 'package:brew_crew_new/services/auth.dart';
import 'package:brew_crew_new/utils/utils.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email = "";
  String _password = "";
  String error = '';

  bool loading = false ;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Brew Crew  -  Sign up'),
        actions: [
          TextButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign-in')
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80,vertical: 50),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: customInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty ? 'Enter Email' : null,
                    onChanged: (val){
                      setState(() {
                        _email = val;
                      });

                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: customInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val.length < 6 ? 'Enter password having more than 6 characters' : null,
                    onChanged: (val){
                      _password = val;
                    },
                  ),
                  SizedBox(height: 80,),
                  ElevatedButton(onPressed: () async{
                    if(_formKey.currentState.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic  result = await _auth.signUpWithEmailAndPassword(_email, _password);
                      if(result == null){
                        setState(() {
                          print('Failure Signed up');
                          error = 'Enter correct email or password';
                          loading = false;
                        });
                      }else{
                        setState(() {
                          print('Successfully Signed up');
                        });
                        // print(result.uid);
                      }
                    }
                  }, child: Text('Sign up ')
                  ),
                  SizedBox(height: 20,),
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
