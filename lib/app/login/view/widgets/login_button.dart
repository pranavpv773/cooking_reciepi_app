import 'package:flutter/material.dart';
import 'package:food_reciepi/app/sign_up/view/sign_up.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:food_reciepi/routes/routes.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        RoutesProvider.nextScreen(screen: const SignUpScreen());
      },
      child: Text(
        text,
        style: TextStyle(
          color: kPrimary,
          fontSize: 15,
        ),
      ),
    );
  }
}
