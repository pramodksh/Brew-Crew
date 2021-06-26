import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DatabaseServices{

  String uid;
  DatabaseServices({this.uid});

  final brewsCollection = FirebaseFirestore.instance.collection('brews');
  Future updateCollection ({@required String sugar,@required String name,@required int strength })async{
    return await brewsCollection.doc(uid).set({
      'sugars' : sugar,
      'name' : name,
      'strength' : strength,
    });
  }

  Stream<QuerySnapshot> get brews{
    print('object || DATATYPE: ${brewsCollection.snapshots().first.runtimeType}');
    return brewsCollection.snapshots();
  }
}