// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDdnQuWaZvito-mKrsIIuf0ScS4KsCKoVA',
    appId: '1:749441343807:web:f72258afd8c592d3b6b38a',
    messagingSenderId: '749441343807',
    projectId: 'portfolio2610',
    authDomain: 'portfolio2610.firebaseapp.com',
    storageBucket: 'portfolio2610.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbr-tS6y3iCANhbCEQEW4i2tSiXDfvzM4',
    appId: '1:749441343807:android:a746c9e771e20975b6b38a',
    messagingSenderId: '749441343807',
    projectId: 'portfolio2610',
    storageBucket: 'portfolio2610.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBx0rLq5jT9IvOToZ0qIdHZA3RZX-tijrM',
    appId: '1:749441343807:ios:9102a4be2ea7e5d6b6b38a',
    messagingSenderId: '749441343807',
    projectId: 'portfolio2610',
    storageBucket: 'portfolio2610.firebasestorage.app',
    iosBundleId: 'com.example.portfolio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBx0rLq5jT9IvOToZ0qIdHZA3RZX-tijrM',
    appId: '1:749441343807:ios:9102a4be2ea7e5d6b6b38a',
    messagingSenderId: '749441343807',
    projectId: 'portfolio2610',
    storageBucket: 'portfolio2610.firebasestorage.app',
    iosBundleId: 'com.example.portfolio',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDdnQuWaZvito-mKrsIIuf0ScS4KsCKoVA',
    appId: '1:749441343807:web:73498fc5374b598eb6b38a',
    messagingSenderId: '749441343807',
    projectId: 'portfolio2610',
    authDomain: 'portfolio2610.firebaseapp.com',
    storageBucket: 'portfolio2610.firebasestorage.app',
  );
}