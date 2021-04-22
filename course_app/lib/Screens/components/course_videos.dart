import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';

class CourseVideo extends StatelessWidget {
  final String id, duration, title;

  CourseVideo({
    Key key,
    @required this.id,
    @required this.duration,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            this.id,
            style: TextStyle(
                fontSize: 42.0,
                color: Colors.grey.withOpacity(0.6),
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${this.duration} mins',
                    style: TextStyle(fontFamily: "Nunito", color: Colors.grey),
                  ),
                  Text(
                    this.title,
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: kGreenColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
