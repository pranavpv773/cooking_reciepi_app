import 'package:flutter/material.dart';
import 'package:food_reciepi/constants/colors.dart';

class PresizedAppBarWidget extends StatelessWidget {
  const PresizedAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 15,
      shadowColor: kPrimary,
      backgroundColor: kWhite,
      leading: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(
          Icons.menu,
          color: Colors.orange,
        ),
      ),
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'Hi Pranav',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.orange,
            child: Icon(
              Icons.search,
              color: kWhite,
            ),
          ),
        )
      ],
    );
  }
}
