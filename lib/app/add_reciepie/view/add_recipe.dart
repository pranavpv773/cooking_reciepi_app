import 'package:flutter/material.dart';
import 'package:food_reciepi/app/add_reciepie/view/widgets/description_form_widget.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/add_recipi_provider.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/auth_services.dart';
import 'package:food_reciepi/app/sign_up/view/widgets/sign_textform.dart';
import 'package:food_reciepi/app/sign_up/view_model/sign_up_provider.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:provider/provider.dart';

import 'widgets/recipi_image.dart';

class AddReceipeScreen extends StatelessWidget {
  const AddReceipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: context.read<AddRecipiAuth>().registerFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ImageProfileAdd(),
                SignUpTextforms(
                  icon: Icons.person_outline_outlined,
                  text: "Food Name",
                  vertical: 20,
                  controller: context.read<AddRecipiAuth>().foodname,
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
                              controller: context.read<AddRecipiAuth>().time,
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
                                        .radioButtonChanges(value.toString());
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
                DescriptionTextforms(
                  icon: Icons.mail_outline_sharp,
                  vertical: 15,
                  controller: context.read<AddRecipiAuth>().description,
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
          context.read<AddRecipiAuth>().addRecipieToFirebase(
                context,
              );
        },
        child: Text(
          name,
        ),
      ),
    );
  }
}
