import 'package:ecommers/screens/auth/login/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyAyZNjSAXTTeBsPNmxFmflhzXII6aQu2qA", appId: "1:154646946985:web:9fdce2e87b537e400c75b8", messagingSenderId: "154646946985", projectId: "familyfarmer-9c7ac"));

  }
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyAyZNjSAXTTeBsPNmxFmflhzXII6aQu2qA", appId: "1:154646946985:web:9fdce2e87b537e400c75b8", messagingSenderId: "154646946985", projectId: "familyfarmer-9c7ac"));
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set the system UI overlay style to make the status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Make the status bar transparent
        statusBarIconBrightness: Brightness.dark, // Optionally, set the status bar icons color
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Family Farmer',
      home: Login()
    );
  }

}
