// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:food_reciepi/app/home/view/home_screen.dart';
import 'package:food_reciepi/app/login/view_model/login_provider.dart';
import 'package:food_reciepi/app/utility/view/email_form.dart';
import 'package:food_reciepi/app/utility/view/password_form.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:food_reciepi/routes/routes.dart';
import 'package:provider/provider.dart';

class LoginTextforms extends StatelessWidget {
  const LoginTextforms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginProvider>().formKey,
      child: Column(
        children: [
          const EmailTextFormWidget(),
          const PasswordTextFormWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 150,
                      vertical: 15,
                    ),
                    primary: kPrimary,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                  onPressed: (() async {
                    // context.read<LoginProvider>().onTabLoginFunction(
                    //     context,
                    //     context.read<LoginProvider>().email.text,
                    //     context.read<LoginProvider>().password.text);
                    RoutesProvider.removeScreenUntil(
                        screen: const HomeScreen());
                  }),
                  child: const Text(
                    "LOGIN",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
