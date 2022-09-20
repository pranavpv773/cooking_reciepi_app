import 'package:flutter/material.dart';
import 'package:food_reciepi/constants/colors.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
