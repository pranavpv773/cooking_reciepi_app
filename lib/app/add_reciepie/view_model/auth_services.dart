import 'dart:io';

import 'package:flutter/widgets.dart';

class AddRecipiAuth with ChangeNotifier {
  final signUpKey = GlobalKey<FormState>();
  final foodname = TextEditingController();
  final description = TextEditingController();
  final time = TextEditingController();
  final email = TextEditingController();
  File? imagefile;
  String imgstring = '';
  changeImage(String imgstring) {
    this.imgstring = imgstring;
    notifyListeners();
  }

  Future<void> addRecipieToFirebase(
    BuildContext context,
  ) async {
    if (signUpKey.currentState!.validate()) {}
  }
}
