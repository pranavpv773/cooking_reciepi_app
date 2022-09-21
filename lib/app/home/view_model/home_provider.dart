import 'package:flutter/widgets.dart';
import 'package:food_reciepi/app/add_reciepie/view/add_recipe.dart';
import 'package:food_reciepi/app/receipe_screen/view/receipe_screen.dart';
import 'package:food_reciepi/app/settings/view/settings_screen.dart';

class HomeProvider with ChangeNotifier {
  int pageIndex = 1;
  bool showAppbar = true;
  final pages = [
    const AddReceipeScreen(),
    const ReciepeScreen(),
    const SettingsScreen(),
  ];

  onTabIndexChange(int number) {
    pageIndex = number;

    notifyListeners();
  }
}
