import 'package:course_app/Screens/components/best_seller.dart';
import 'package:course_app/Screens/components/course_price.dart';
import 'package:course_app/Screens/components/stats_with_icon_and_value.dart';
import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';

class CourseTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BestSeller(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              "Design Thinking",
              style: kHeadingTextStyle.copyWith(fontSize: 28.0),
            ),
          ),
          Row(
            children: <Widget>[
              StatsWithIconAndValue(
                iconPlaceholder: "assets/icons/person.svg",
                value: "18k",
              ),
              StatsWithIconAndValue(
                iconPlaceholder: "assets/icons/star.svg",
                value: "4.8",
              ),
            ],
          ),
          CoursePrice(
            currentPrice: "\$50",
            previousPrevious: "\$70",
          ),
        ],
      ),
    );
  }
}
