import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD8MMXjo7BC-U3PfL_TRrJFs1mn60i6vMM",
            authDomain: "fitconnect-557fd.firebaseapp.com",
            projectId: "fitconnect-557fd",
            storageBucket: "fitconnect-557fd.firebasestorage.app",
            messagingSenderId: "791122823851",
            appId: "1:791122823851:web:1f144e0cd4888fb75cc5ee",
            measurementId: "G-BJR1YDWZFH"));
  } else {
    await Firebase.initializeApp();
  }
}
