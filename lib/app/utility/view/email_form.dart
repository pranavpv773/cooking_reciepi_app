import 'package:flutter/material.dart';
import 'package:food_reciepi/app/login/view_model/login_provider.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:provider/provider.dart';

class EmailTextFormWidget extends StatelessWidget {
  const EmailTextFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 40, left: 40),
      child: TextFormField(
        validator: (input) => context.read<LoginProvider>().isValidEmail(input!)
            ? null
            : "Check your email",
        keyboardType: TextInputType.emailAddress,
        controller: context.read<LoginProvider>().email,
        style: TextStyle(
          color: kPrimary,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          fillColor: kWhite,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.mail,
              color: kPrimary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: kPrimary,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 2.0,
            ),
          ),
          hintText: "Email",
          hintStyle: TextStyle(
            fontSize: 15,
            color: kPrimary,
          ),
        ),
      ),
    );
  }
}
