// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpd13JbBzeVPRKh1_ZV0xGDcvDxJ9FC9U',
    appId: '1:479803314800:android:69d3b9be3f568ae494dab5',
    messagingSenderId: '479803314800',
    projectId: 'fir-auth-bfb6a',
    storageBucket: 'fir-auth-bfb6a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-o3_66xNGgg5VaXY52YFvUV8pqKRfZGo',
    appId: '1:479803314800:ios:1d947ecbe4d8db8e94dab5',
    messagingSenderId: '479803314800',
    projectId: 'fir-auth-bfb6a',
    storageBucket: 'fir-auth-bfb6a.appspot.com',
    androidClientId:
        '479803314800-274go3738rhn51hfcge3u5albbdrmq8e.apps.googleusercontent.com',
    iosClientId:
        '479803314800-a1kh4k7bep3gosfp06pa9ucn95631eu5.apps.googleusercontent.com',
    iosBundleId: 'com.example.challenge1',
  );
}