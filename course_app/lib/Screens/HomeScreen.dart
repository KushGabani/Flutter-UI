import 'package:course_app/Screens/components/course_grid_view.dart';
import 'package:course_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:course_app/Screens/components/greeting.dart';
import 'package:course_app/Screens/components/nav_bar.dart';
import 'package:course_app/Screens/components/search_box.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NavBar(avatar: "assets/images/user.png"),
              SizedBox(height: 30),
              Greeting(username: "Kush Gabani"),
              SearchBox(),
              CourseGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
