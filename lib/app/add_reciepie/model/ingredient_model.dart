class IngredientModel {
  String? uid;

  String? ingredient;
  double? quantity;

  IngredientModel({
    this.ingredient,
    this.quantity,
    this.uid,
  });

//data from Server

  factory IngredientModel.fromMap(Map<String, dynamic> map) {
    return IngredientModel(
      uid: map['uid'],
      ingredient: map['ingredient'],
      quantity: map['quantity'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'ingredient': ingredient,
      'quantity': quantity,
    };
  }
}
