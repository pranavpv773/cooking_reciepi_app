import 'package:flutter/material.dart';
import 'package:food_reciepi/app/sign_up/view_model/sign_up_provider.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:provider/provider.dart';

import 'widgets/avathar_card.dart';
import 'widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            color: kWhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AvatharCard(),
                SignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
