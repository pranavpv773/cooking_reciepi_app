import 'package:flutter/material.dart';
import 'package:food_reciepi/app/home/view_model/home_provider.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavyWidget extends StatelessWidget {
  const BottomNavyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      curve: Curves.ease,
      currentIndex: context.watch<HomeProvider>().pageIndex,
      onTap: (index) => context.read<HomeProvider>().onTabIndexChange(index),
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Icons.home_rounded),
          title: const Text('Home'),
          selectedColor: Colors.red,
          unselectedColor: kPrimary,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.menu_book_sharp),
          title: const Text('Add Recipe'),
          selectedColor: Colors.purpleAccent,
          unselectedColor: kPrimary,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.settings_applications_sharp),
          title: const Text('Settings'),
          selectedColor: Colors.pink,
          unselectedColor: kPrimary,
        ),
      ],
    );
  }
}
