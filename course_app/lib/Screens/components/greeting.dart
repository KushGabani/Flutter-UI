import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';

class Greeting extends StatelessWidget {
  final String username;

  const Greeting({
    Key key,
    this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hey! " + this.username + ",",
            style: kHeadingTextStyle,
          ),
          Text(
            "Find a course you want to learn",
            style: kSubHeadingTextStyle.copyWith(height: 1.25, fontSize: 21.0),
          ),
        ],
      ),
    );
  }
}
