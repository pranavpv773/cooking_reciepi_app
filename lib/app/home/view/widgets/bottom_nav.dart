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
    return BottomNavigationBar(
      currentIndex: context.watch<HomeProvider>().pageIndex,
      elevation: 5,
      selectedItemColor: kPrimary,
      unselectedIconTheme: IconThemeData(color: kWhite),
      unselectedItemColor: kWhite,
      backgroundColor: kTeal,

      // currentIndex: context.watch<HomeProvider>().pageIndex,
      onTap: (index) => context.read<HomeProvider>().onTabIndexChange(index),
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.menu_book_sharp,
              color: kPrimary,
            ),
            label: 'Add Recipe'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: kPrimary,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_applications_sharp,
              color: kPrimary,
            ),
            label: 'Settings'),
      ],
    );
  }
}
