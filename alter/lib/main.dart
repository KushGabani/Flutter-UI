import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './resources/auth_methods.dart';
import './Screens/SignUpScreen.dart';
import './Screens/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alter Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: AuthMethods.getCurrentUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if(!snapshot.hasData) {
            return SignUpScreen();
          } else {
            return HomeScreen();
          }
        }
      )
    );
  }
}