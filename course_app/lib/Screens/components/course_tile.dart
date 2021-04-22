import 'package:course_app/constants.dart';
import 'package:course_app/model/category.dart';
import 'package:flutter/material.dart';

class CourseTile extends StatelessWidget {
  final int index;

  CourseTile({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: index.isEven ? 200 : 240,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kBlueColor,
        image: DecorationImage(
          image: AssetImage(categories[index].image),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            categories[index].name,
            style: kTitleTextStyle,
          ),
          Text(
            '${categories[index].numOfCourses} courses',
            style: TextStyle(
              color: kTextColor.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
