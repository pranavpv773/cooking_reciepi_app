import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_reciepi/app/home/view/home_screen.dart';
import 'package:food_reciepi/app/login/view/login_screen.dart';
import 'package:food_reciepi/app/sign_up/view_model/sign_up_provider.dart';
import 'package:food_reciepi/app/utility/view_model/snack_provider.dart';
import 'package:food_reciepi/routes/routes.dart';
import 'package:provider/provider.dart';

class LoginProvider with ChangeNotifier {
  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final password = TextEditingController();
  bool isLoading = false;
  onTabLoginFunction(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      try {
        await context
            .read<SignUpProvider>()
            .auth
            .signInWithEmailAndPassword(
                email: email.text, password: password.text)
            .then(
              (value) => {
                RoutesProvider.removeScreenUntil(screen: const HomeScreen()),
              },
            );
        notifyListeners();
        email.clear();
        password.clear();
      } on FirebaseAuthException catch (e) {
        isLoading = false;
        context.read<SnackTProvider>().errorBox(
              context,
              e.message.toString(),
            );
      }
    }
  }

  Future<void> logOut(BuildContext context) async {
    await context.read<SignUpProvider>().auth.signOut().then((value) =>
        RoutesProvider.removeScreenUntil(screen: const LoginScreen()));
  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
