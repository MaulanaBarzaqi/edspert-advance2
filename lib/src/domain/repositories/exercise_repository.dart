import 'package:advance/src/data/models/exercise_model.dart';

abstract class ExerciseRepository {
  Future<ExerciseResponse> getExerciseData(String courseId);
}
