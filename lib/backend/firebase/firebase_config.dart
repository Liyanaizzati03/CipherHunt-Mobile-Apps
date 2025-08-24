import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAasM8AA1vUynXVOa7qvjXnbgaY91AJ_qE",
            authDomain: "cipherhunt-8l4cam.firebaseapp.com",
            projectId: "cipherhunt-8l4cam",
            storageBucket: "cipherhunt-8l4cam.firebasestorage.app",
            messagingSenderId: "745477093012",
            appId: "1:745477093012:web:c3a9fe1e9a682004a82681"));
  } else {
    await Firebase.initializeApp();
  }
}
