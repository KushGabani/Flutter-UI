import 'package:flutter/material.dart';
import './constants.dart';
import './Screens/sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SFPro',
        scaffoldBackgroundColor: ColorPallete.kLightBlueColor,
        accentColor: ColorPallete.kAccentColor,
        buttonColor: ColorPallete.kDarkBlueColor,
      ),
      home: SignUpScreen(),
    );
  }
}
