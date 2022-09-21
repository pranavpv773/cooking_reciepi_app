import 'package:flutter/material.dart';
import 'package:food_reciepi/app/add_reciepie/view/widgets/description_form_widget.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/add_recipi_provider.dart';
import 'package:food_reciepi/app/sign_up/view/widgets/sign_textform.dart';
import 'package:food_reciepi/app/sign_up/view_model/sign_up_provider.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:provider/provider.dart';

class AddReceipeScreen extends StatelessWidget {
  const AddReceipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignUpTextforms(
                  icon: Icons.person_outline_outlined,
                  text: "Food Name",
                  vertical: 20,
                  controller: context.read<SignUpProvider>().userName,
                ),
                DescriptionTextforms(
                  icon: Icons.mail_outline_sharp,
                  text: "Email",
                  vertical: 15,
                  controller: context.read<SignUpProvider>().email,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: SignUpTextforms(
                              icon: Icons.send_to_mobile_rounded,
                              text: "Time",
                              vertical: 15,
                              controller:
                                  context.read<SignUpProvider>().phoneNumber,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.blue,
                                  value: '0',
                                  groupValue: context
                                      .watch<AddRecipiProvider>()
                                      .radioValue,
                                  onChanged: (value) {
                                    context
                                        .read<AddRecipiProvider>()
                                        .radioButtonChanges(value!.toString());
                                  },
                                ),
                                const Text(
                                  "Veg",
                                ),
                                Radio(
                                  value: '1',
                                  groupValue: context
                                      .watch<AddRecipiProvider>()
                                      .radioValue,
                                  onChanged: (value) {
                                    context
                                        .read<AddRecipiProvider>()
                                        .radioButtonChanges(value!.toString());
                                  },
                                ),
                                const Text(
                                  "Non-Veg",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SignUpTextforms(
                  icon: Icons.lock_outline,
                  text: "Password",
                  vertical: 15,
                  controller: context.read<SignUpProvider>().password,
                ),
                SignUpTextforms(
                  icon: Icons.lock_reset_outlined,
                  text: "Confirm Password",
                  vertical: 15,
                  controller: context.read<SignUpProvider>().confirmPassword,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'INGREDIENTS',
                    style: TextStyle(color: kTeal),
                  ),
                ),
                const Center(child: ButtonWidget(name: 'ADD RECIPI')),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: kTeal,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 120,
            vertical: 15,
          ),
          primary: kPrimary,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
        ),
        onPressed: () {
          context.read<SignUpProvider>().signUp(
                context,
                context.read<SignUpProvider>().email.text,
                context.read<SignUpProvider>().password.text,
                context.read<SignUpProvider>().userName.text,
                context.read<SignUpProvider>().phoneNumber.text,
                context.read<SignUpProvider>().confirmPassword.text,
              );
        },
        child: Text(
          name,
        ),
      ),
    );
  }
}
