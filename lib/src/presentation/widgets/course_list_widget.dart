import 'package:advance/src/core/constants/color_constants.dart';
import 'package:advance/src/data/models/course_model.dart';
import 'package:advance/src/presentation/screens/exercise_list_screen.dart';
import 'package:advance/src/presentation/widgets/image_network_widget.dart';
import 'package:flutter/material.dart';

class CourseListWidget extends StatelessWidget {
  final int itemCount;
  final List<CourseData> courseList;
  const CourseListWidget({
    super.key,
    required this.itemCount,
    required this.courseList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final course = courseList[index];

        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ExerciseListScreen(
                      courseId: course.courseId ?? '',
                    )),
          ),
          child: SizedBox(
            height: 96,
            child: Card(
              color: Colors.white,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 53,
                      height: 53,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstants.greyBackground,
                      ),
                      child: ImageNetworkWidget(
                        imageUrl: course.urlCover ?? '',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.courseName ?? 'no course name',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '${course.jumlahDone}/${course.jumlahMateri}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.greyFont),
                          ),
                          const SizedBox(height: 11),
                          const LinearProgressIndicator(
                            value: 0.5,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
