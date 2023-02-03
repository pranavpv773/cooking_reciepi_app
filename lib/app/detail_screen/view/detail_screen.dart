import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/auth_services.dart';
import 'package:food_reciepi/app/detail_screen/view/widgets/ingredient_widgets.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.image,
    required this.description,
    required this.name,
    required this.time,
    required this.uid,
    required this.hours,
  }) : super(key: key);
  final String image;
  final String description;
  final String name;
  final String time;
  final String hours;
  final String uid;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AddRecipiAuth>(context, listen: false)
          .getListFromMap(context, uid);
    });
    final size = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: size / 3,
                decoration: BoxDecoration(
                  color: kPrimary,
                  image: DecorationImage(
                    image: MemoryImage(
                      const Base64Decoder().convert(
                        image,
                      ),
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          height: 1.5,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$time $hours',
                      style: const TextStyle(height: 1.5, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: const TextStyle(height: 1.5, fontSize: 16),
                ),
              ),
              Divider(
                height: 20,
                color: kTeal,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Ingredients Used',
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                height: 20,
                color: kTeal,
              ),
              const IngredientWidgetCard()
            ],
          ),
        ),
      ),
    );
  }
}
