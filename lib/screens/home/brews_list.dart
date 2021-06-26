import 'package:brew_crew_new/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {

  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<QuerySnapshot>(context);
    //print(brews.documents);

    if (brews != null)
    for (var doc in brews.docs) {
      print("DATA ${doc.data()}");
    }
    return Container(

    );
  }
}
