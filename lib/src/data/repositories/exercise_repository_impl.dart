import 'dart:developer';

import 'package:advance/src/core/constants/api_constants.dart';
import 'package:advance/src/data/models/exercise_model.dart';
import 'package:advance/src/domain/repositories/exercise_repository.dart';
import 'package:dio/dio.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  @override
  Future<ExerciseResponse> getExerciseData(String courseId) async {
    try {
      final exercisePath = '${ApiContants.apiUrl}${ApiContants.exercisePath}';
      final queryParameters = {
        'sub_course_content_id': courseId,
        'user_email': 'testerngbayu@gmail.com',
      };
      final response = await Dio().get(
        exercisePath,
        queryParameters: queryParameters,
        options: Options(headers: ApiContants.headers),
      );
      log('Response: ${response.data}');

      final data = ExerciseResponse.fromJson(response.data);

      return data;
    } catch (e, stackTrace) {
      log('Error at getExerciseData: ${e.toString()}', stackTrace: stackTrace);
      return ExerciseResponse();
    }
  }
}
