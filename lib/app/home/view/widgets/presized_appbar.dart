import 'package:flutter/material.dart';
import 'package:food_reciepi/app/login/view_model/login_provider.dart';
import 'package:food_reciepi/app/sign_up/view_model/sign_up_provider.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:provider/provider.dart';

class PresizedAppBarWidget extends StatelessWidget {
  const PresizedAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      shadowColor: kPrimary,
      backgroundColor: kWhite,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.orange,
          child: Image.asset('assets/men_avathar.png'),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'Hi ${context.read<SignUpProvider>().loggedUserModel.username}',
          style: const TextStyle(
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
