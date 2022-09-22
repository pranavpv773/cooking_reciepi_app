import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/add_recipi_provider.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/auth_services.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/image_services.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/ingredient_provider.dart';
import 'package:food_reciepi/app/home/view_model/home_provider.dart';
import 'package:food_reciepi/app/login/view_model/login_provider.dart';
import 'package:food_reciepi/app/sign_up/view_model/sign_up_provider.dart';
import 'package:food_reciepi/app/splash/view_model/splash_provider.dart';
import 'package:food_reciepi/app/utility/view_model/snack_provider.dart';
import 'package:provider/provider.dart';
import 'app/splash/view/splash_screen.dart';
import 'routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider(
          create: (create) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => SnackTProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => AddRecipiProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => AddRecipiAuth(),
        ),
        ChangeNotifierProvider(
          create: (create) => ImageProviderReceipi(),
        ),
        ChangeNotifierProvider(
          create: (create) => IngredientProvider(),
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
