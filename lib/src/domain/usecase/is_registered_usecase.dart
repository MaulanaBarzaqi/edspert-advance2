import 'package:advance/src/domain/repositories/auth_repository.dart';

class IsRegisteredUsecase {
  final AuthRepository repository;

  IsRegisteredUsecase(this.repository);

  Future<bool> call(String email) {
    return repository.isRegisteredUsecase(email);
  }
}
