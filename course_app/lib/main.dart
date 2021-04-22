import 'package:course_app/Screens/CourseDetailScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CourseDetailScreen(),
      // home: HomeScreen(),
    );
  }
}