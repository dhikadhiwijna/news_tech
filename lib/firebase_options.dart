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
    apiKey: 'AIzaSyDZ5kHr-UdwdJCq65QBxFX4S-iiYGL5Yio',
    appId: '1:109288031139:web:5e1bbc33a9935307981016',
    messagingSenderId: '109288031139',
    projectId: 'adhika-portfolio',
    authDomain: 'adhika-portfolio.firebaseapp.com',
    storageBucket: 'adhika-portfolio.appspot.com',
    measurementId: 'G-JJEHHK9NRS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAi0kgRJr8c-LZ4Oh9Nt0EtwtSABvHjhGQ',
    appId: '1:109288031139:android:7e9e2092d8e41175981016',
    messagingSenderId: '109288031139',
    projectId: 'adhika-portfolio',
    storageBucket: 'adhika-portfolio.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_MGoI5ZtjsZmBw8zLJ7TWI-tYRaLM3j8',
    appId: '1:109288031139:ios:c66e7f2d74376dc4981016',
    messagingSenderId: '109288031139',
    projectId: 'adhika-portfolio',
    storageBucket: 'adhika-portfolio.appspot.com',
    iosBundleId: 'com.dhikadhiwijna.newsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_MGoI5ZtjsZmBw8zLJ7TWI-tYRaLM3j8',
    appId: '1:109288031139:ios:c66e7f2d74376dc4981016',
    messagingSenderId: '109288031139',
    projectId: 'adhika-portfolio',
    storageBucket: 'adhika-portfolio.appspot.com',
    iosBundleId: 'com.dhikadhiwijna.newsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDZ5kHr-UdwdJCq65QBxFX4S-iiYGL5Yio',
    appId: '1:109288031139:web:6893fa0c4d9f0253981016',
    messagingSenderId: '109288031139',
    projectId: 'adhika-portfolio',
    authDomain: 'adhika-portfolio.firebaseapp.com',
    storageBucket: 'adhika-portfolio.appspot.com',
    measurementId: 'G-W41N84QZK9',
  );
}
