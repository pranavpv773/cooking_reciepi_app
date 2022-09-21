import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_reciepi/constants/colors.dart';

class HomeCardsWidgets extends StatelessWidget {
  const HomeCardsWidgets({
    Key? key,
    required this.foodName,
    required this.veg,
    required this.image,
    // required this.doc,
  }) : super(key: key);

  final String foodName;
  final String veg;
  final String image;
  // final QueryDocumentSnapshot<Object?> doc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Material(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  elevation: 10,
                  child: Container(
                    height: constraints.maxHeight * 0.8,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: kPrimary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                // right: 0,
                top: 90,
                child: Hero(
                  tag: foodName,
                  child: CircleAvatar(
                    backgroundColor: kWhite,
                    radius: 80,
                    backgroundImage: MemoryImage(
                      const Base64Decoder().convert(
                        image,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                // left: 20,
                right: 40,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Nunito',
                          color: kWhite,
                        ),
                      ),
                      Text(
                        veg,
                        style: TextStyle(
                          color: kWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
