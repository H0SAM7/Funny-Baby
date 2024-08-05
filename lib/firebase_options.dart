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
    apiKey: 'AIzaSyAR0EjXjumpiHXLkPy1x8uZc9xEAiL2e0A',
    appId: '1:183077435261:web:b9445225b7ed65d52cfe14',
    messagingSenderId: '183077435261',
    projectId: 'storeapp-5f88d',
    authDomain: 'storeapp-5f88d.firebaseapp.com',
    databaseURL: 'https://storeapp-5f88d-default-rtdb.firebaseio.com',
    storageBucket: 'storeapp-5f88d.appspot.com',
    measurementId: 'G-GM20QW7LMX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyasvNqP1-TTUsZkX93gRVQVBBnJzHx3I',
    appId: '1:183077435261:android:14066b95b9e0ebbd2cfe14',
    messagingSenderId: '183077435261',
    projectId: 'storeapp-5f88d',
    databaseURL: 'https://storeapp-5f88d-default-rtdb.firebaseio.com',
    storageBucket: 'storeapp-5f88d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrtFOVnWxuCctSAltn2fEJYa2ZIyb0UbE',
    appId: '1:183077435261:ios:c18e14f7246230082cfe14',
    messagingSenderId: '183077435261',
    projectId: 'storeapp-5f88d',
    databaseURL: 'https://storeapp-5f88d-default-rtdb.firebaseio.com',
    storageBucket: 'storeapp-5f88d.appspot.com',
    iosClientId: '183077435261-bfp8s911osihh3g6lbrp44j74u6cv3bj.apps.googleusercontent.com',
    iosBundleId: 'com.example.funnyBaby',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCrtFOVnWxuCctSAltn2fEJYa2ZIyb0UbE',
    appId: '1:183077435261:ios:c18e14f7246230082cfe14',
    messagingSenderId: '183077435261',
    projectId: 'storeapp-5f88d',
    databaseURL: 'https://storeapp-5f88d-default-rtdb.firebaseio.com',
    storageBucket: 'storeapp-5f88d.appspot.com',
    iosClientId: '183077435261-bfp8s911osihh3g6lbrp44j74u6cv3bj.apps.googleusercontent.com',
    iosBundleId: 'com.example.funnyBaby',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAR0EjXjumpiHXLkPy1x8uZc9xEAiL2e0A',
    appId: '1:183077435261:web:9c8d83e2668d9f382cfe14',
    messagingSenderId: '183077435261',
    projectId: 'storeapp-5f88d',
    authDomain: 'storeapp-5f88d.firebaseapp.com',
    databaseURL: 'https://storeapp-5f88d-default-rtdb.firebaseio.com',
    storageBucket: 'storeapp-5f88d.appspot.com',
    measurementId: 'G-J091VE68YX',
  );

}