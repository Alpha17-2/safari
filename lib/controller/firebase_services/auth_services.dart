import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/providers/user_provider.dart';

class Authservice {
  // Create an instance of firebase authentication.
  final FirebaseAuth _auth;

  Authservice(this._auth);
  //auth is an private property !!

  // ignore: non_constant_identifier_names

  Stream<User?> get austhStateChanges => _auth.authStateChanges();

//sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

//sign in with email and password  !!
  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "valid";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      String? returnResponse;
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        // create a new user
        dynamic response =
            await Provider.of<UserProvider>(context, listen: false)
                .registerNewUser({
          'title': 'New User',
          'id': value.user!.uid,
          'likedPlaces': [],
          'visitedPlaces': []
        });
        if (response.toString() == 'OK') {
          returnResponse = 'valid';
        } else {
          returnResponse = response.toString();
        }
      });
      print('sign up response = $returnResponse');
      return returnResponse;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
