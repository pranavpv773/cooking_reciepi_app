// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:food_reciepi/app/add_reciepie/model/ingredient_model.dart';
import 'package:food_reciepi/app/add_reciepie/model/recipe_model.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/ingredient_provider.dart';
import 'package:food_reciepi/app/home/view/home_screen.dart';
import 'package:food_reciepi/app/home/view_model/home_provider.dart';
import 'package:food_reciepi/app/login/model/user_model.dart';
import 'package:food_reciepi/app/sign_up/view_model/sign_up_provider.dart';
import 'package:food_reciepi/app/utility/view_model/snack_provider.dart';
import 'package:food_reciepi/constants/image_text.dart';
import 'package:food_reciepi/routes/routes.dart';
import 'package:provider/provider.dart';

class AddRecipiAuth with ChangeNotifier {
  final registerFormKey = GlobalKey<FormState>();
  final foodname = TextEditingController();
  final description = TextEditingController();
  final time = TextEditingController();
  final email = TextEditingController();
  String? selectItem;
  ReceipiModel receipiModel = ReceipiModel();
  UserModel userLogged = UserModel();
  IngredientListModel ingredientListModel = IngredientListModel();

  File? imagefile;
  String imgstring = '';
  changeImage(String imgstring) {
    this.imgstring = imgstring;
    notifyListeners();
  }

  void selectTeam(String value) {
    selectItem = value;
    notifyListeners();
  }

  Future<void> addRecipieToFirebase(
    BuildContext context,
  ) async {
    if (registerFormKey.currentState!.validate()) {
      if (context.read<IngredientProvider>().ingredient1.text == '') {
        context
            .read<SnackTProvider>()
            .errorBox(context, 'Please Add Ingredients');
      } else {
        if (imgstring == '') {
          imgstring = TempImage.imageTemp;
        }
        try {
          await context
              .read<IngredientProvider>()
              .addIngredientListToRecipi(context);
          // calling our fireStore
          FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
          User? user = context.read<SignUpProvider>().auth.currentUser;
          //calling our userModel
          receipiModel.foodname = foodname.text;
          receipiModel.description = description.text;
          receipiModel.time = time.text;
          receipiModel.veg = selectItem;
          receipiModel.uid = user!.uid;
          receipiModel.image = imgstring;
          receipiModel.ingredientModel =
              context.read<IngredientProvider>().ingredientListModel;

          //sending details to fireStore
          await firebaseFirestore
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.email)
              .collection('receipi')
              .add(
                receipiModel.toMap(),
              )
              .then((value) {
            context.read<HomeProvider>().onTabIndexChange(1);
            disposeController();
            context.read<IngredientProvider>().ingredientDisposeController();
            RoutesProvider.removeScreenUntil(screen: const HomeScreen());
          });

          context.read<SnackTProvider>().successSnack(context);
        } on FirebaseException catch (e) {
          context
              .read<SnackTProvider>()
              .errorBox(context, e.message.toString());
        }
      }
    }
  }

  getDataFromCloud(BuildContext context) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((value) {
      UserModel.fromMap(value.data()!);
      userLogged = UserModel.fromMap(value.data()!);

      RoutesProvider.removeScreenUntil(screen: const HomeScreen());
    });
  }

  getListFromMap(BuildContext context, String uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('receipi')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((value) {
      ReceipiModel.fromMap(value.data()!);
      receipiModel = ReceipiModel.fromMap(value.data()!);
      log(value.data().toString());
    });
  }

  disposeController() {
    foodname.clear();
    time.clear();
    description.clear();
    imgstring = '';
  }
}
