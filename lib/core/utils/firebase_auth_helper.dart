import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  Future signInWithEmailAndPassword(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future signOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return await auth.signOut();
  }
}
