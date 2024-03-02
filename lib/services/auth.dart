import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_netninja/models/user.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // CREATE USER OBJ BASED ON FIREBASEUSER
  UserID? _userFromFirebaseUser(User? user) {
    return user != null ? UserID(uid: user.uid) : null;
  }

  // AUTH CHANGE USER 'STREAM'
  Stream<UserID?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebaseUser);
  }

  // SIGN IN ANONYMOUS
  Future signInAnon() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print("Firebase Authentication Error: ${e.message}");
      return null;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  // SIGN IN WITH EMAIL PASSWORD
  // Future<User?> signInWithEmailPassword(String email, String password) async {
  //   try {
  //     UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     User? user = result.user;
  //     return user;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // REGISTER WITH EMAIL PASSWORD
  // Future<User?> registerWithEmailPassword(
  //     String email, String password) async {
  //   try {
  //     UserCredential result = await _firebaseAuth
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     User? user = result.user;
  //     return user;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // SIGN OUT
  // Future<void> signOut() async {
  //   await _firebaseAuth.signOut();
  // }
}
