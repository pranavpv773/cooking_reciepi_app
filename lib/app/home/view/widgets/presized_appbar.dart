import 'package:flutter/material.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/auth_services.dart';
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
          'Hi ${context.read<AddRecipiAuth>().userLogged.username}',
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
