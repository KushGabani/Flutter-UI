import 'package:course_app/Screens/components/course_videos.dart';
import 'package:course_app/constants.dart';
import 'package:course_app/model/courses.dart';
import 'package:flutter/material.dart';

class CourseContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              offset: const Offset(5.0, -10.0),
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Course Content",
              style: kSubHeadingTextStyle.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            // ListView.builder(
            //   itemCount: 1,
            //   itemBuilder: (context, index) {
            //     return CourseVideo(
            //       id: courseVideos[index].id,
            //       duration: courseVideos[index].duration,
            //       title: courseVideos[index].title,
            //     );
            //   },
            // ),
            //
            // ListView(
            //   children: courseVideos
            //       .map(
            //         (video) => CourseVideo(
            //             id: video.id,
            //             duration: video.duration,
            //             title: video.title),
            //       )
            //       .toList(),
            // )

            // ListView(
            //   children: <Widget>[
            //     CourseVideo(
            //       id: "01",
            //       duration: "5:35",
            //       title: "Welcome to the Course",
            //     ),
            //     CourseVideo(
            //       id: "02",
            //       duration: "6:10",
            //       title: "What is UX Design",
            //     ),
            //     CourseVideo(
            //       id: "03",
            //       duration: "3:55",
            //       title: "Difference between UI & UX",
            //     ),
            //     CourseVideo(
            //       id: "04",
            //       duration: "2:58",
            //       title: "Are UX designers worth it?",
            //     ),
            //     CourseVideo(
            //       id: "05",
            //       duration: "9:32",
            //       title: "The UX Roadmap",
            //     ),
            //     CourseVideo(
            //       id: "06",
            //       duration: "8:03",
            //       title: "UX of the evil",
            //     ),
            //     CourseVideo(
            //       id: "08",
            //       duration: "12:05",
            //       title: "Gestalt's Law of UX",
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
