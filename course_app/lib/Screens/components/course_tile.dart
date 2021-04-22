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
      height: index.isEven ? 175.0 : 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(categories[index].image),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: index.isEven ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(5.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow//BoxShadow
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  categories[index].name,
                  style: kTitleTextStyle,
                ),
                Text(
                  '${categories[index].numOfCourses} courses',
                  style: kSubHeadingTextStyle.copyWith(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
