abstract class AuthRepository {
  Future<bool> isRegisteredUsecase(String email);

  Future<bool> registerUsecase();

  bool isSignedInWithGoogleUsecase();

  Future<String?> signInWithGoogleUsecase();
}
