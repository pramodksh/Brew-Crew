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
  String error = '';

  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              TextButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Sign-up',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .40,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: customInputDecoration.copyWith(
                              icon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              hintText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter Email' : null,
                          onChanged: (val) {
                            setState(() {
                              _email = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: customInputDecoration.copyWith(
                              icon: Icon(
                                Icons.lock_outline_sharp,
                                color: Colors.white,
                              ),
                              hintText: 'Password'),
                          validator: (val) => val.length < 6
                              ? 'Enter password having more than 6 characters'
                              : null,
                          onChanged: (val) {
                            _password = val;
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        getCustomElevatedButton(
                            buttonText: 'Sign in',
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        _email, _password);
                                if (result == null) {
                                  setState(() {
                                    print('Failure Signing in');
                                    error = 'Enter correct email or password';
                                  });
                                } else {
                                  setState(() {
                                    print('Successfully Signed in');
                                  });
                                }
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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
