import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/auth_services.dart';
import 'package:food_reciepi/app/home/view/home_screen.dart';
import 'package:food_reciepi/app/home/view_model/home_provider.dart';
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
    isLoading = true;
    if (formKey.currentState!.validate()) {
      try {
        await context
            .read<SignUpProvider>()
            .auth
            .signInWithEmailAndPassword(
                email: email.text, password: password.text)
            .then(
              (value) => {
                isLoading = false,
                context.read<AddRecipiAuth>().getDataFromCloud(context),
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
    await context.read<SignUpProvider>().auth.signOut().then((value) {
      return RoutesProvider.removeScreenUntil(
        screen: const LoginScreen(),
      );
    });
    // ignore: use_build_context_synchronously
    context.read<HomeProvider>().pageIndex = 1;
  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
