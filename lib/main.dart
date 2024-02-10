import 'package:ecommers/screens/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
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
