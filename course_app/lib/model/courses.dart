class Course {
  final int courseId;
  final String courseName;
  final List<CourseVideos> courseVideo;
  Course(this.courseId, this.courseName, this.courseVideo);
}

class CourseVideos {
  final String id;
  final String duration;
  final String title;
  CourseVideos(this.id, this.duration, this.title);
}

var courseVideoData = [
  {
    "index": "01",
    "duration": "5:35",
    "title": "Welcome to the Course",
  },
  {
    "index": "02",
    "duration": "6:10",
    "title": "What is UX Design?",
  },
  {
    "index": "03",
    "duration": "3:55",
    "title": "Difference between UI & UX",
  },
  {
    "index": "04",
    "duration": "2:58",
    "title": "Are UX designers worth it?",
  },
  {
    "index": "05",
    "duration": "9:32",
    "title": "The UX Roadmap",
  },
  {
    "index": "06",
    "duration": "8:03",
    "title": "UX of the evil",
  },
  {
    "index": "07",
    "duration": "5:15",
    "title": "Basics of UX",
  },
  {
    "index": "08",
    "duration": "12:05",
    "title": "Gestalt's Law of UX",
  },
];

List<CourseVideos> courseVideos = courseVideoData
    .map((video) => CourseVideos(
          video["index"],
          video["duration"],
          video["title"],
        ))
    .toList();

// var courseData = [
//   {
//     "course_id": 1,
//     "course_name": "UX Design",
//     "course_video": [
//       {
//         "index": "01",
//         "duration": "5:35",
//         "title": "Welcome to the Course",
//       },
//       {
//         "index": "02",
//         "duration": "6:10",
//         "title": "What is UX Design?",
//       },
//       {
//         "index": "03",
//         "duration": "3:55",
//         "title": "Difference between UI & UX",
//       },
//       {
//         "index": "04",
//         "duration": "3:55",
//         "title": "Are UX designers worth it?",
//       },
//       {
//         "index": "05",
//         "duration": "9:32",
//         "title": "The UX Roadmap",
//       },
//       {
//         "index": "06",
//         "duration": "8:03",
//         "title": "UX of the evil",
//       },
//       {
//         "index": "07",
//         "duration": "5:15",
//         "title": "Basics of UX",
//       },
//       {
//         "index": "08",
//         "duration": "12:05",
//         "title": "Gestalt Law of UX",
//       },
//     ]
//   }
// ];

// List<Course> courses = courseData
//     .map(
//       (course) => Course(
//         course["course_id"],
//         course["course_name"],
//         course["course_video"].map(
//           (video) => CourseVideos(
//             video["index"],
//             video["duration"],
//             video["title"],
//           ),
//         ),
//       ),
//     )
//     .toList();
