import 'package:flutter/material.dart';
import 'package:food_reciepi/app/home/view/home_screen.dart';
import 'package:food_reciepi/constants/colors.dart';

class HomeCardsWidgets extends StatelessWidget {
  const HomeCardsWidgets({Key? key, required this.index}) : super(key: key);
  final int index;
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
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  elevation: 10,
                  child: Container(
                    height: constraints.maxHeight * 0.8,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: kPrimary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 1,
                child: Hero(
                  tag: 'avathar$index',
                  child: CircleAvatar(
                    backgroundColor: kWhite,
                    radius: 80,
                    backgroundImage: NetworkImage(images[index]),
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 20,
                right: 0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Food Name',
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Nunito',
                          color: kWhite,
                        ),
                      ),
                      Text(
                        'Type',
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
