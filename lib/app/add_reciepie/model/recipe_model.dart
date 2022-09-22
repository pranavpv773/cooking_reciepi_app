import 'package:food_reciepi/app/add_reciepie/model/ingredient_model.dart';

class ReceipiModel {
  String? uid;
  String? foodname;
  String? description;
  String? time;
  String? veg;
  String? image;
  IngredientModel? ingredientModel;
  ReceipiModel({
    this.uid,
    this.foodname,
    this.description,
    this.time,
    this.veg,
    this.image,
    this.ingredientModel,
  });

//data from Server

  factory ReceipiModel.fromMap(Map<String, dynamic> map) {
    return ReceipiModel(
      uid: map['uid'],
      foodname: map['foodname'],
      description: map['description'],
      time: map['time'],
      veg: map['veg'],
      image: map['image'],
      ingredientModel: map['ingredientModel'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'foodname': foodname,
      'description': description,
      'time': time,
      'veg': veg,
      'image': image,
      'ingredientModel': ingredientModel,
    };
  }
}
