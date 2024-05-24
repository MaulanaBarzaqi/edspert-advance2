import 'package:advance/src/domain/repositories/auth_repository.dart';

class SignInWithGoogleUsecase {
  final AuthRepository repository;

  SignInWithGoogleUsecase(this.repository);

  Future<String?> call() {
    return repository.signInWithGoogleUsecase();
  }
}
