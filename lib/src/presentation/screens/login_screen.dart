import 'package:advance/src/presentation/manager/auth/auth_bloc.dart';
import 'package:advance/src/presentation/screens/register_screen.dart';
import 'package:advance/src/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/login-image.png'),
                  const SizedBox(height: 56),
                  const Text(
                    'selamat datang',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'selamat datang di aplikasi widya Edu\n'
                    'aplikasi latihan dan konsultasi soal',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6A7483)),
                  ),
                ],
              ),
              Column(
                children: [
                  BlocConsumer<AuthBloc, AuthState>(
                    //listener
                    listenWhen: (prev, next) =>
                        prev is SignInGoogleLoading &&
                        (next is SignInGoogleError ||
                            next is SignInGoogleSuccess),
                    listener: (context, state) {
                      print('listener: AuthBloc');
                      if (state is SignInGoogleSuccess) {
                        print('Google sign in Success: ${state.email}');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ));
                      }
                    },
                    //builder
                    buildWhen: (prev, next) =>
                        prev is SignInGoogleLoading &&
                        (next is SignInGoogleError ||
                            next is SignInGoogleSuccess),
                    builder: (context, state) {
                      print('builder: AuthBloc');
                      if (state is SignInGoogleLoading) {
                        return const CircularProgressIndicator();
                      }

                      return LoginButton(
                        loginButtonVariant: LoginButtonVariant.google,
                        onPressed: () {
                          context.read<AuthBloc>().add(SignInWithGoogleEvent());
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  LoginButton(
                    loginButtonVariant: LoginButtonVariant.apple,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
