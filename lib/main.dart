import 'package:flutter/material.dart';
import 'package:registration_app/Screens/Welcome/welcome_screen.dart';
import 'package:registration_app/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SafeArea(
          child: WelcomeScreen(),
      ),
    );
  }
}
