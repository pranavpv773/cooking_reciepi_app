import 'package:flutter/widgets.dart';
import 'package:food_reciepi/app/login/view/login_screen.dart';
import 'package:food_reciepi/routes/routes.dart';

class SpalshProvider with ChangeNotifier {
  Future<void> goHome(BuildContext context) async {
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    RoutesProvider.removeScreen(
      screen: const LoginScreen(),
    );
  }
}
