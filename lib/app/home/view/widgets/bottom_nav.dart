import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_reciepi/app/home/view_model/home_provider.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:provider/provider.dart';

class BottomNavyWidget extends StatelessWidget {
  const BottomNavyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      initialActiveIndex: 1,
      elevation: 5,
      shadowColor: kTeal,
      activeColor: kTeal,
      backgroundColor: kWhite,
      curve: Curves.linear,
      style: TabStyle.reactCircle,
      // currentIndex: context.watch<HomeProvider>().pageIndex,
      onTap: (index) => context.read<HomeProvider>().onTabIndexChange(index),
      items: [
        TabItem(
            icon: Icon(
              Icons.menu_book_sharp,
              color: kPrimary,
            ),
            title: 'Add Recipe'),
        TabItem(
            icon: Icon(
              Icons.home_rounded,
              color: kPrimary,
            ),
            title: 'Home'),
        TabItem(
            icon: Icon(
              Icons.settings_applications_sharp,
              color: kPrimary,
            ),
            title: 'Settings'),
      ],
    );
  }
}
