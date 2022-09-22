import 'package:flutter/material.dart';
import 'package:food_reciepi/app/add_reciepie/view/widgets/description_form_widget.dart';
import 'package:food_reciepi/app/add_reciepie/view/widgets/dropdown_widget.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/add_recipi_provider.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/auth_services.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/ingredient_provider.dart';
import 'package:food_reciepi/app/sign_up/view/widgets/sign_textform.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:provider/provider.dart';

import 'widgets/recipi_image.dart';

class AddReceipeScreen extends StatelessWidget {
  const AddReceipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Form(
            key: context.read<AddRecipiAuth>().registerFormKey,
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
                            flex: 10,
                            child: SignUpTextforms(
                              textType: TextInputType.number,
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
                        children: const <Widget>[
                          Expanded(
                            flex: 2,
                            child: DropDownWidget(),
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
                const AddIngredientExpansion(),
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

class AddIngredientExpansion extends StatelessWidget {
  const AddIngredientExpansion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'ADD INGREDIENTS',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
      children: <Widget>[
        IngredientWidget(
          ingredientController: context.read<IngredientProvider>().ingredient1,
          quantityController: context.read<IngredientProvider>().quantity1,
        ),
        IngredientWidget(
            ingredientController:
                context.read<IngredientProvider>().ingredient2,
            quantityController: context.read<IngredientProvider>().quantity2),
        IngredientWidget(
            ingredientController:
                context.read<IngredientProvider>().ingredient3,
            quantityController: context.read<IngredientProvider>().quantity3),
        IngredientWidget(
            ingredientController:
                context.read<IngredientProvider>().ingredient4,
            quantityController: context.read<IngredientProvider>().quantity4),
        IngredientWidget(
            ingredientController:
                context.read<IngredientProvider>().ingredient5,
            quantityController: context.read<IngredientProvider>().quantity5),
      ],
    );
  }
}

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({
    Key? key,
    required this.ingredientController,
    required this.quantityController,
  }) : super(key: key);
  final TextEditingController ingredientController;
  final TextEditingController quantityController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: SignUpTextforms(
                  icon: Icons.food_bank_rounded,
                  text: "Ingredient",
                  vertical: 15,
                  controller: ingredientController,
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
                child: SignUpTextforms(
                  textType: TextInputType.number,
                  icon: Icons.view_comfortable_outlined,
                  text: "quantity",
                  vertical: 15,
                  controller: quantityController,
                ),
              )
            ],
          ),
        ),
      ],
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
