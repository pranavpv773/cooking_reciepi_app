import 'package:flutter/material.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SnackTProvider with ChangeNotifier {
  void errorBox(BuildContext context, String message) {
    return showTopSnackBar(
      context,
      CustomSnackBar.error(
        iconPositionLeft: 0,
        iconPositionTop: 0,
        iconRotationAngle: 0,
        icon: Icon(
          Icons.error_rounded,
          color: kPrimary,
        ),
        message: message,
      ),
    );
  }

  void errorPassword(BuildContext context, String msg) {
    return showTopSnackBar(
      context,
      CustomSnackBar.error(
        iconPositionLeft: 0,
        iconPositionTop: 0,
        iconRotationAngle: 0,
        icon: Icon(
          Icons.error,
          color: kPrimary,
        ),
        message: msg,
      ),
    );
  }

  void successSnack(BuildContext context) {
    return showTopSnackBar(
      context,
      CustomSnackBar.success(
        iconPositionLeft: 0,
        iconPositionTop: 0,
        iconRotationAngle: 0,
        icon: Icon(
          Icons.done_outline_rounded,
          color: kPrimary,
        ),
        backgroundColor: const Color.fromARGB(196, 255, 255, 255),
        message: "successfully added",
      ),
    );
  }
}
