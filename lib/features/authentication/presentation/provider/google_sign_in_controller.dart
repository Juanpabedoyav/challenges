import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends ChangeNotifier {
  GoogleSignInAccount? _user;

  // get user from google sign in account and set it to _user variable
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print(_user?.email);
    print(_user?.displayName);
    print(_user?.id);
    print(credentials);
    await FirebaseAuth.instance.signInWithCredential(credentials);

    notifyListeners();
  }
}
