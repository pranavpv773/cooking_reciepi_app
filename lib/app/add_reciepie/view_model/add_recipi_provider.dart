import 'package:flutter/widgets.dart';

class AddRecipiProvider with ChangeNotifier {
  String? choice;
  String? radioValue;
  void radioButtonChanges(String value) {
    radioValue = value;
    switch (value) {
      case '0':
        choice = "Veg";

        break;
      case '1':
        choice = "Non-Veg";

        break;

      default:
        choice = null;
    }
    notifyListeners();
  }
}
