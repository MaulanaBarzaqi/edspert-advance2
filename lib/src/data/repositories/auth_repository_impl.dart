import 'package:advance/src/data/data_source/auth_data_source.dart';
import 'package:advance/src/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<bool> isRegisteredUsecase(String email) {
    // TODO: implement isRegisteredUsecase
    throw UnimplementedError();
  }

  @override
  Future<bool> registerUsecase() {
    // TODO: implement registerUsecase
    throw UnimplementedError();
  }

  @override
  bool isSignedInWithGoogleUsecase() {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<String?> signInWithGoogleUsecase() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredentialResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredentialResult.user?.email;
    } catch (e) {
      debugPrint('Err signInWithGoogle $e');
      return null;
    }
  }
}
