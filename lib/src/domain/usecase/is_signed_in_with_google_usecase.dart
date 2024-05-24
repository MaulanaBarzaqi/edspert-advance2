import 'package:advance/src/domain/repositories/auth_repository.dart';

class IsSignedInWithGoogleUsecase {
  final AuthRepository repository;

  IsSignedInWithGoogleUsecase(this.repository);

  bool call() {
    return repository.isSignedInWithGoogleUsecase();
  }
}
