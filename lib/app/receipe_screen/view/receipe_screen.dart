import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_reciepi/app/home/view/home_screen.dart';
import 'package:food_reciepi/app/home/view/widgets/home_card.dart';

class ReciepeScreen extends StatelessWidget {
  const ReciepeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: HomeCardsWidgets(
            index: index,
          ),
        );
      },
    );
  }
}
