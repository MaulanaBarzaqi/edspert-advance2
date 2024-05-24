import 'package:advance/src/data/models/course_model.dart';
import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  final CourseData course;
  const CourseDetail({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(course.courseName ?? 'no course name'),
          Text('${course.jumlahDone}/${course.jumlahMateri}'),
        ],
      ),
    );
  }
}
