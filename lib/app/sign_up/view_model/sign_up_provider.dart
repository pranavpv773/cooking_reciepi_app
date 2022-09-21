import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_reciepi/app/home/view/home_screen.dart';
import 'package:food_reciepi/app/login/model/user_model.dart';
import 'package:food_reciepi/app/utility/view_model/snack_provider.dart';
import 'package:food_reciepi/routes/routes.dart';
import 'package:provider/provider.dart';

class SignUpProvider with ChangeNotifier {
  final signUpKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  UserModel loggedUserModel = UserModel();
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signUp(
    BuildContext context,
  ) async {
    if (signUpKey.currentState!.validate()) {
      if (password.text != confirmPassword.text) {
        context
            .read<SnackTProvider>()
            .errorPassword(context, "password not matching");
      } else {
        try {
          await auth
              .createUserWithEmailAndPassword(
                  email: email.text, password: password.text)
              .then((value) => {postDetailsToFirebase(context)});
        } on FirebaseAuthException catch (ex) {
          context
              .read<SnackTProvider>()
              .errorBox(context, ex.message.toString());
        }
      }
    }
  }

  void postDetailsToFirebase(BuildContext context) async {
    // calling our fireStore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    //calling our userModel

    loggedUserModel.email = user!.email;
    loggedUserModel.uid = user.uid;
    loggedUserModel.username = userName.text;

    //sending details to fireStore
    await firebaseFirestore.collection('users').doc(user.uid).set(
          loggedUserModel.toMap(),
        );
    disposeControll();
    // ignore: use_build_context_synchronously
    context.read<SnackTProvider>().successSnack(context);
    await RoutesProvider.removeScreenUntil(screen: const HomeScreen());
  }

  disposeControll() {
    userName.clear();
    email.clear();
    confirmPassword.clear();
    password.clear();
  }
}
