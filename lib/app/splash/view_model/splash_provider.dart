// ignore_for_file: use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/auth_services.dart';
import 'package:food_reciepi/app/home/view/home_screen.dart';
import 'package:food_reciepi/app/login/view/login_screen.dart';
import 'package:food_reciepi/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshProvider with ChangeNotifier {
  Future<void> goHome(BuildContext context) async {
    final checkLogged = await SharedPreferences.getInstance();
    final checkResult = checkLogged.getBool('login') ?? false;
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    if (checkResult) {
      await context.read<AddRecipiAuth>().getDataFromCloud(context);
    } else {
      RoutesProvider.removeScreen(
        screen: const LoginScreen(),
      );
    }
  }
}
