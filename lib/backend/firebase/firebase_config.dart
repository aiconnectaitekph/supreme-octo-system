import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDTsjYZNWFfZOESP-2QQfbD7jc5fG9FJdc",
            authDomain: "explore-malaysia-6d28d.firebaseapp.com",
            projectId: "explore-malaysia-6d28d",
            storageBucket: "explore-malaysia-6d28d.appspot.com",
            messagingSenderId: "869053244601",
            appId: "1:869053244601:web:a1e4d6b45ca33b080be768",
            measurementId: "G-MSJKTXK40D"));
  } else {
    await Firebase.initializeApp();
  }
}
