import 'package:flutter/material.dart';
import 'package:food_reciepi/app/login/view_model/login_provider.dart';
import 'package:food_reciepi/app/splash/view_model/splash_provider.dart';
import 'package:provider/provider.dart';
import 'app/splash/view/splash_screen.dart';
import 'routes/routes.dart';

void main() {
  runApp(const CookieApp());
}

class CookieApp extends StatelessWidget {
  const CookieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (create) => SpalshProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: RoutesProvider.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
