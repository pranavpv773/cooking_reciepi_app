import 'package:flutter/material.dart';
import 'package:food_reciepi/app/add_reciepie/view/add_recipe.dart';
import 'package:food_reciepi/app/home/view_model/home_provider.dart';
import 'package:food_reciepi/routes/routes.dart';
import 'package:provider/provider.dart';

class HomeNull extends StatelessWidget {
  const HomeNull({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/food/empty_lottie.gif',
            ),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Add Receipi",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
