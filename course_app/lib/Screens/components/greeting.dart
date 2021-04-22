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
    return Row(
      children: <Widget>[
        Text(
          "Hey! " + this.username + ",",
          style: kHeadingTextStyle,
        ),
        Text(
          "Find a course you want to learn",
          style: kSubHeadingTextStyle,
        ),
      ],
    );
  }
}
