import 'package:brew_crew_new/model/user.dart';
import 'package:brew_crew_new/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Stream

  Stream<UserDetail> get userStream {
    return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
  }


  //UserDetail Constructor

  dynamic _userFromFirebase(User user) {
    return user != null ? UserDetail(uid: user.uid) : null;
  }

  //Sign-in anonymously

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print('ERROR : -> $e.toString()');
      return null;
    }
  }

  //Sign-in with email and password

  Future signUpWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      DatabaseServices(uid: user.uid).updateCollection(sugar: '0', name: "new member", strength: 100);
      print('sign up successful');
      return _userFromFirebase(user);
    } catch (e) {
      print('sign up failed');
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign-out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
