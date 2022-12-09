import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flash_for_teamproject/auth/user.dart';

class Auth extends ChangeNotifier {
  MyUser? getMyUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return MyUser.fromFirebase(user);
    }
    return null;
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signInAnonymously() async {
    await FirebaseAuth.instance.signInAnonymously();
  }

  Future<void> signOut() async {
    final user = getMyUser();
    if (user != null) {
      FirebaseAuth.instance.signOut();
    }
  }
}
