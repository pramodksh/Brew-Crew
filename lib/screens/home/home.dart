import 'package:brew_crew_new/screens/home/brews_list.dart';
import 'package:brew_crew_new/services/auth.dart';
import 'package:brew_crew_new/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      initialData: null,
      value: DatabaseServices().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[300],
        appBar: AppBar(
          title: Text('Brew Crew'),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async{
                await _auth.signOut();
                // print(DatabaseServices().brews);
              },
              icon: Icon(Icons.logout,color: Colors.brown[800],),
              label: Text('logout',style: TextStyle(
                color: Colors.brown[800]
              ),),
            )
          ],
          backgroundColor: Colors.brown,
        ),
        body: Builder(
          builder: (context) {
            print("BUILDER");
            return  BrewList();
          }
        )
      ),
    );
  }
}
