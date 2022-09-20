import 'package:flutter/material.dart';
import 'package:food_reciepi/constants/colors.dart';

import 'widgets/home_card.dart';
import 'widgets/presized_appbar.dart';

final List images = [
  'https://img.myloview.com/posters/indian-chilli-chicken-dry-served-in-a-plate-over-moody-background-selective-focus-400-166076125.jpg',
  'https://img.myloview.com/posters/indian-chilli-chicken-dry-served-in-a-plate-over-moody-background-selective-focus-400-149830638.jpg',
  'https://im.indiatimes.in/media/content/2015/Feb/boldsky_1423825016.jpg',
  'https://media-cdn.tripadvisor.com/media/photo-s/17/fa/5f/75/kg-s-chinese-fast-food.jpg',
  'https://drop.ndtv.com/albums/COOKS/7-best-chinese-_637643889502897808/637643889529388592.jpeg',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: PresizedAppBarWidget(),
        ),
        body: ListView.builder(
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
        ),
      ),
    );
  }
}
