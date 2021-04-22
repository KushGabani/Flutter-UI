import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';

class CoursePrice extends StatelessWidget {
  final String currentPrice, previousPrevious;

  CoursePrice({
    Key key,
    @required this.currentPrice,
    this.previousPrevious,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(this.currentPrice, style: kHeadingTextStyle.copyWith(fontSize: 32.0)),
          SizedBox(width: 10.0),
          Text(
            this.previousPrevious,
            style: TextStyle(
                color: kTextColor.withOpacity(0.5),
                fontSize: 18.0,
                decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }
}
