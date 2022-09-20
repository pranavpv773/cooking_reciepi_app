import 'package:flutter/material.dart';
import 'app/splash/view/splash_screen.dart';

void main() {
  runApp(const CookieApp());
}

class CookieApp extends StatelessWidget {
  const CookieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
