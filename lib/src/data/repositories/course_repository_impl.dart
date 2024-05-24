import 'dart:developer';

import 'package:advance/src/domain/repositories/course_repository.dart';
import 'package:dio/dio.dart';
import 'package:advance/src/data/models/course_model.dart';

class CourseRepositoryImpl implements CourseRepository {
  @override
  Future<CourseResponse> getCourseList() async {
    //pengambilan data
    try {
      //mencoba dalam block ini
      const apiUrl = 'https://edspert.widyaedu.com/';
      const String urlPath = '${apiUrl}exercise/data_course';
      const queryParams = {
        'major_name': 'IPA',
        'user_email': 'testerngbayu@gmail.com',
      };
      final headers = {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a3'};

      final response = await Dio().get(
        urlPath,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );

      final data = CourseResponse.fromJson(response.data);
      return data;
    } catch (e, stackTrace) {
      log('error at getCourseList: ${e.toString()} ', stackTrace: stackTrace);
      return CourseResponse();
    }
  }
}
