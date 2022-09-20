import 'package:flutter/material.dart';
import 'package:food_reciepi/constants/colors.dart';

class AvatharCard extends StatelessWidget {
  const AvatharCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kPrimary,
          height: 200,
        ),
        Container(
          height: 100,
          color: Colors.amber[200],
        ),
        Positioned(
          bottom: 40,
          right: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/logo.png',
              width: 200,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/food/login_food1.png',
              width: 150,
            ),
          ),
        ),
      ],
    );
  }
}
