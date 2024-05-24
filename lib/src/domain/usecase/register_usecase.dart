import 'package:advance/src/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  Future<bool> call() {
    return repository.registerUsecase();
  }
}
