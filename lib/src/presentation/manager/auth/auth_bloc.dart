import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:advance/src/domain/usecase/is_signed_in_with_google_usecase.dart';
import 'package:advance/src/domain/usecase/sign_in_with_google_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsSignedInWithGoogleUsecase isSignedInWithGoogleUsecase;
  final SignInWithGoogleUsecase signInWithGoogleUsecase;

  AuthBloc(
    this.isSignedInWithGoogleUsecase,
    this.signInWithGoogleUsecase,
  ) : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      //is signed in with google
      if (event is IsSignedInWithGoogleEvent) {
        emit(IsSignedInWithGoogleLoading());

        bool isSignIn = isSignedInWithGoogleUsecase();
        await Future.delayed(const Duration(seconds: 3));
        if (isSignIn) {
          emit(IsSignedInWithGoogleSuccess());
          return;
        }
        emit(IsSignedInWithGoogleError());
      }
      //sign in with google
      if (event is SignInWithGoogleEvent) {
        emit(SignInGoogleLoading());

        String? email = await signInWithGoogleUsecase();
        if (email != null) {
          emit(SignInGoogleSuccess(email));
          return;
        }
        emit(SignInGoogleError('error sign in...'));
      }
    });
  }
}
