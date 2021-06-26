import 'package:brew_crew_new/screens/wrapper.dart';
import 'package:brew_crew_new/services/auth.dart';
import 'package:brew_crew_new/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
  Provider.debugCheckInvalidValueType = null;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var brews = Provider.of<QuerySnapshot>(context);
    return StreamProvider.value(
      initialData: null,
      value: AuthService().userStream,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
