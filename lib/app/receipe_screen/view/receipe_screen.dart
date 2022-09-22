import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/auth_services.dart';
import 'package:food_reciepi/app/home/view/widgets/home_card.dart';
import 'package:provider/provider.dart';

import 'widget/null_safety.dart';

class ReciepeScreen extends StatelessWidget {
  const ReciepeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(context.read<AddRecipiAuth>().userLogged.email)
            .collection('receipi')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const HomeNull();
          } else if (snapshot.data!.docs.isEmpty) {
            return const HomeNull();
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: HomeCardsWidgets(
                    description: snapshot.data!.docs[index]['description'],
                    foodName: snapshot.data!.docs[index]['foodname'],
                    image: snapshot.data!.docs[index]['image'],
                    veg: snapshot.data!.docs[index]['veg'],
                    time: snapshot.data!.docs[index]['time'],
                    doc: snapshot.data!.docs[index],
                  ),
                );
              },
            );
          }
        });
  }
}
