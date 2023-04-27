import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBoxaQZfpqixoRnSgkzNll9JlEUW6RZiMU",
            authDomain: "hlth-b2518.firebaseapp.com",
            projectId: "hlth-b2518",
            storageBucket: "hlth-b2518.appspot.com",
            messagingSenderId: "428839088498",
            appId: "1:428839088498:web:72f519c80ca3b38100edeb",
            measurementId: "G-CWGB2VSNFF"));
  } else {
    await Firebase.initializeApp();
  }
}
