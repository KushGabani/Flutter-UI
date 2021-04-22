import 'package:course_app/Screens/components/back_nav_bar.dart';
import 'package:course_app/Screens/components/course_content.dart';
import 'package:course_app/Screens/components/course_title.dart';
import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: size.height,
          decoration: BoxDecoration(
            color: Color(0xFFF5F4EF),
            image: DecorationImage(
              image: AssetImage("assets/images/ux_big.png"),
              alignment: Alignment.topRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BackNavBar(),
              CourseTitle(),
              CourseContent(),
            ],
          ),
        ),
      ),
    );
  }
}
