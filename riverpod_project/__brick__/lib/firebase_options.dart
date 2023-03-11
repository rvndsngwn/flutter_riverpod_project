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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA3RlJf3asv6hXGoV9qHnfNQk7-3_v7shg',
    appId: '1:443371518217:web:43ad064053a02828e0fbd8',
    messagingSenderId: '443371518217',
    projectId: 'mohesu-server',
    authDomain: 'mohesu-server.firebaseapp.com',
    databaseURL: 'https://mohesu-server.firebaseio.com',
    storageBucket: 'mohesu-server.appspot.com',
    measurementId: 'G-FLX845LTM1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEpHHPm42AgIgO4xsvGYtn8E45ekQKwMY',
    appId: '1:443371518217:android:2962286f51b5cb81e0fbd8',
    messagingSenderId: '443371518217',
    projectId: 'mohesu-server',
    databaseURL: 'https://mohesu-server.firebaseio.com',
    storageBucket: 'mohesu-server.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5-GEAtNvmorqmRrztbluHyy6QTJli2n8',
    appId: '1:443371518217:ios:e9d3c9296e5fda8ee0fbd8',
    messagingSenderId: '443371518217',
    projectId: 'mohesu-server',
    databaseURL: 'https://mohesu-server.firebaseio.com',
    storageBucket: 'mohesu-server.appspot.com',
    iosClientId:
        '443371518217-kq4tjarpbru1lff4sa58c448re0bf6jo.apps.googleusercontent.com',
    iosBundleId: 'com.mohesu.serverMohesu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD5-GEAtNvmorqmRrztbluHyy6QTJli2n8',
    appId: '1:443371518217:ios:e9d3c9296e5fda8ee0fbd8',
    messagingSenderId: '443371518217',
    projectId: 'mohesu-server',
    databaseURL: 'https://mohesu-server.firebaseio.com',
    storageBucket: 'mohesu-server.appspot.com',
    iosClientId:
        '443371518217-kq4tjarpbru1lff4sa58c448re0bf6jo.apps.googleusercontent.com',
    iosBundleId: 'com.mohesu.serverMohesu',
  );
}
