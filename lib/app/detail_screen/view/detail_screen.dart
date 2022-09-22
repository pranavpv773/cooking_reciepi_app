import 'package:flutter/material.dart';
import 'package:food_reciepi/constants/colors.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: size / 3,
              decoration: BoxDecoration(
                color: kPrimary,
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/food/login_food1.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Text(
              "Nowadays, making printed materials have become fast, easy and simple. If you want your promotional material to be an eye-catching object, you should make it colored. By way of using inkjet printer this is not hard to make. An inkjet printer is any printer that places extremely small droplets of ink onto paper to create an image.",
              style: TextStyle(
                height: 1.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
