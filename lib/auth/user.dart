import 'package:firebase_auth/firebase_auth.dart';

class MyUser {
  final String? name;
  final String uid;
  final String? email;
  final String profileImgURL;

  MyUser({
    required this.name,
    required this.uid,
    required this.email,
    required this.profileImgURL,
  });

  factory MyUser.fromFirebase(User user) => MyUser(
        name: user.displayName,
        uid: user.uid,
        email: user.email,
        profileImgURL:
            user.photoURL ?? "http://handong.edu/site/handong/res/img/logo.png",
      );
}
