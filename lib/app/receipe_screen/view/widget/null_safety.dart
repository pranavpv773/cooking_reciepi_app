import 'package:flutter/material.dart';

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
            fit: BoxFit.contain),
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
