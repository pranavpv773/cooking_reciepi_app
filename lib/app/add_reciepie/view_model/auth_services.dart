// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:food_reciepi/app/add_reciepie/model/recipe_model.dart';
import 'package:food_reciepi/app/home/view/home_screen.dart';
import 'package:food_reciepi/app/login/model/user_model.dart';
import 'package:food_reciepi/app/sign_up/view_model/sign_up_provider.dart';
import 'package:food_reciepi/app/utility/view_model/snack_provider.dart';
import 'package:food_reciepi/routes/routes.dart';
import 'package:provider/provider.dart';

class AddRecipiAuth with ChangeNotifier {
  final registerFormKey = GlobalKey<FormState>();
  final foodname = TextEditingController();
  final description = TextEditingController();
  final time = TextEditingController();
  final email = TextEditingController();
  ReceipiModel receipiModel = ReceipiModel();
  UserModel userLogged = UserModel();
  File? imagefile;
  String imgstring = '';
  changeImage(String imgstring) {
    this.imgstring = imgstring;
    notifyListeners();
  }

  Future<void> addRecipieToFirebase(
    BuildContext context,
  ) async {
    if (registerFormKey.currentState!.validate()) {
      try {
        // calling our fireStore
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        User? user = context.read<SignUpProvider>().auth.currentUser;
        //calling our userModel

        receipiModel.foodname = foodname.text;
        receipiModel.description = description.text;
        receipiModel.time = time.text;
        receipiModel.veg = "Add email";
        receipiModel.uid = user!.uid;
        receipiModel.image = imgstring;

        //sending details to fireStore
        await firebaseFirestore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.email)
            .collection('receipi')
            .add(
              receipiModel.toMap(),
            );

        context.read<SnackTProvider>().successSnack(context);
        RoutesProvider.removeScreenUntil(screen: const HomeScreen());
      } on FirebaseException catch (e) {
        context.read<SnackTProvider>().errorBox(context, e.message.toString());
      }
    }
  }
}