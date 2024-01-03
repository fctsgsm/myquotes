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
    apiKey: 'AIzaSyBZ3eElxvQPYogfdvZ6XscTUgJpiBNUA7Y',
    appId: '1:104273923904:web:20e3fa4f3a7458a882f4a5',
    messagingSenderId: '104273923904',
    projectId: 'quotes-b8bb5',
    authDomain: 'quotes-b8bb5.firebaseapp.com',
    storageBucket: 'quotes-b8bb5.appspot.com',
    measurementId: 'G-QZZ66SMKFE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1aFNIzYdJQJXfoQlEODmBys8WgApKhfc',
    appId: '1:104273923904:android:94281e7028f2197982f4a5',
    messagingSenderId: '104273923904',
    projectId: 'quotes-b8bb5',
    storageBucket: 'quotes-b8bb5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBefzwRb9KUL03sUaMwOn413WOW41NEnWk',
    appId: '1:104273923904:ios:5ac3f548f6d0521582f4a5',
    messagingSenderId: '104273923904',
    projectId: 'quotes-b8bb5',
    storageBucket: 'quotes-b8bb5.appspot.com',
    iosBundleId: 'com.gsm.myquotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBefzwRb9KUL03sUaMwOn413WOW41NEnWk',
    appId: '1:104273923904:ios:620e9d85ecc8861482f4a5',
    messagingSenderId: '104273923904',
    projectId: 'quotes-b8bb5',
    storageBucket: 'quotes-b8bb5.appspot.com',
    iosBundleId: 'com.gsm.myquotes.RunnerTests',
  );
}
