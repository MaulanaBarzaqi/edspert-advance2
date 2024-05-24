import 'package:flutter/material.dart';

enum LoginButtonVariant {
  google,
  apple;

  String get buttonTitle {
    switch (this) {
      case google:
        return 'login dengan google';
      default:
        return 'login dengan apple ID';
    }
  }

  Color get textColor {
    switch (this) {
      case google:
        return Colors.black;
      default:
        return Colors.white;
    }
  }

  Color get buttonColor {
    switch (this) {
      case google:
        return Colors.white;
      default:
        return Colors.black;
    }
  }
}

class LoginButton extends StatelessWidget {
  final LoginButtonVariant loginButtonVariant;
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.loginButtonVariant,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width * 0.7,
      child: ElevatedButton(
          onPressed: onPressed
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const HomeScreen(),
          //   ),
          // );
          // print(
          //     'login dengan ${loginButtonVariant.name} ${loginButtonVariant.buttonTitle}');
          ,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(loginButtonVariant.buttonColor)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/images/${loginButtonVariant.name}-logo.png'),
                const SizedBox(width: 12),
                Text(
                  loginButtonVariant.buttonTitle,
                  style: TextStyle(color: loginButtonVariant.textColor),
                ),
              ],
            ),
          )),
    );
  }
}
