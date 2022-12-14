// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA7XL0Fax1eD1moaOG5FHgA4D_43VoQSh8',
    appId: '1:346470561859:web:36439700c6068da14bfcf6',
    messagingSenderId: '346470561859',
    projectId: 'flashfinal-ce964',
    authDomain: 'flashfinal-ce964.firebaseapp.com',
    storageBucket: 'flashfinal-ce964.appspot.com',
    measurementId: 'G-P4260S5VVV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuBVVQW5RzUvTLaj6PDt_4kvm0vDFlx8w',
    appId: '1:346470561859:android:bc5053da1a9edc464bfcf6',
    messagingSenderId: '346470561859',
    projectId: 'flashfinal-ce964',
    storageBucket: 'flashfinal-ce964.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0fCilJC_GucZYY5I8yTaE9VNbdtHy8eY',
    appId: '1:346470561859:ios:35d02ef5d6da18094bfcf6',
    messagingSenderId: '346470561859',
    projectId: 'flashfinal-ce964',
    storageBucket: 'flashfinal-ce964.appspot.com',
    iosClientId: '346470561859-8e689t1s98qu6eg0pbo2s1u976t282t2.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashForTeamproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0fCilJC_GucZYY5I8yTaE9VNbdtHy8eY',
    appId: '1:346470561859:ios:35d02ef5d6da18094bfcf6',
    messagingSenderId: '346470561859',
    projectId: 'flashfinal-ce964',
    storageBucket: 'flashfinal-ce964.appspot.com',
    iosClientId: '346470561859-8e689t1s98qu6eg0pbo2s1u976t282t2.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashForTeamproject',
  );
}
