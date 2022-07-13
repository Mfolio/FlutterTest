
import 'package:blogapp/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;


class AuthServices{

  final auth.FirebaseAuth _firebase_auth = auth.FirebaseAuth.instance;


  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    } 
    return User(user.email, user.uid);
  }

  Stream<User?>? get user {
    return _firebase_auth.authStateChanges().map(_userFromFirebase);
  }





  Future<User?> signInWithEmailAndPassword(
    String email,
    String password
  ) async {
    try {  
      
       final credential = await _firebase_auth.signInWithEmailAndPassword(email: email, password: password);
       return _userFromFirebase(credential.user);

    }on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print('No user found for that email.');
        return null;
        // ignore: dead_code
      } else if (e.code == 'wrong-password') {
        return null;
      }
    }
    return null;
  }




  Future<User?> createUserWithEmailAndPassword(
    String email,
    String password
  ) async {
    final credential = await _firebase_auth.createUserWithEmailAndPassword(email: email, password: password);

    return _userFromFirebase(credential.user);
  }




  Future<void> signOut() async {
    return await _firebase_auth.signOut();
  }

}
