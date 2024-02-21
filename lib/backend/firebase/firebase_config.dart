import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCDSs7c60WB95w_uurd2kz2yhutchc1JPQ",
            authDomain: "todoapp-green.firebaseapp.com",
            projectId: "todoapp-green",
            storageBucket: "todoapp-green.appspot.com",
            messagingSenderId: "583099047132",
            appId: "1:583099047132:web:f40c13604d2f2e5f63a819",
            measurementId: "G-ZEVE8CZQ76"));
  } else {
    await Firebase.initializeApp();
  }
}
