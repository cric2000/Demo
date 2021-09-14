import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth;

  Authentication(this._auth);

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<String> signup(String email , String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed up";
    }
    catch(e){
      return "not signed up";
    }
  }

  Future<String> login(String email , String password) async {
    try{
       await _auth.signInWithEmailAndPassword(email: email, password: password);
       return "Logged in";
    }
    catch(e){
      return "not logged in";
    }
  }

}