import 'package:flutter/material.dart';
import 'package:login_page_2/Screens/splash.dart';

const saveKeyName = 'userLoggedIn';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const ScreenSplash(),
    );
  }
}
