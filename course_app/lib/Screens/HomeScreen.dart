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
          padding: const EdgeInsets.all(20.0),
          height: size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NavBar(avatar: "assets/images/user.png"),
              SizedBox(height: 30),
              Greeting(username: "Kush Gabani"),
              SearchBox(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Categories",
                      style: kTitleTextStyle,
                    ),
                    Text(
                      "See All",
                      style: kSubtitleTextStyle.copyWith(color: kBlueColor),
                    ),
                  ],
                ),
              ),
              CourseGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
