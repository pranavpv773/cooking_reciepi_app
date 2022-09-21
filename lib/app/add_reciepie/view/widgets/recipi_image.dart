// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/auth_services.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/image_services.dart';
import 'package:food_reciepi/constants/colors.dart';
import 'package:provider/provider.dart';

class ImageProfileAdd extends StatelessWidget {
  const ImageProfileAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<AddRecipiAuth>(context, listen: true)
            .imgstring
            .isNotEmpty
        ? Consumer<AddRecipiAuth>(
            builder: (context, value, child) {
              return GestureDetector(
                  onTap: () {
                    context
                        .read<ImageProviderReceipi>()
                        .showBottomSheet(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        image: DecorationImage(
                          image: MemoryImage(
                            const Base64Decoder().convert(
                              value.imgstring,
                            ),
                          ),
                          fit: BoxFit.cover,
                        )),
                  ));
            },
          )
        : GestureDetector(
            onTap: () {
              context.read<ImageProviderReceipi>().showBottomSheet(context);
            },
            child: CircleAvatar(
              backgroundColor: kTeal,
              radius: 80,
              child: Image.asset(
                "assets/food/login_food1.png",
              ),
            ),
          );
  }
}
