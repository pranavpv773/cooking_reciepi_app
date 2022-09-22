class IngredientModel {
  String? uid;
  IngredientListModel? ingredientListModel;

  IngredientModel({
    this.ingredientListModel,
    this.uid,
  });

//data from Server

  factory IngredientModel.fromMap(Map<String, dynamic> map) {
    return IngredientModel(
      uid: map['uid'] ?? '',
      ingredientListModel:
          IngredientListModel.fromMap(map['ingredientListModel']),
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'ingredientListModel': ingredientListModel!.toMap(),
    };
  }
}

class IngredientListModel {
  String? uid;
  String? ingredient1;
  double? quantity1;
  String? ingredient2;
  double? quantity2;
  String? ingredient3;
  double? quantity3;
  String? ingredient4;
  double? quantity4;
  String? ingredient5;
  double? quantity5;

  IngredientListModel({
    this.ingredient1,
    this.quantity1,
    this.ingredient2,
    this.quantity2,
    this.ingredient3,
    this.quantity3,
    this.ingredient4,
    this.quantity4,
    this.ingredient5,
    this.quantity5,
    this.uid,
  });

//data from Server

  factory IngredientListModel.fromMap(Map<String, dynamic> map) {
    return IngredientListModel(
      uid: map['uid'] ?? '',
      ingredient1: map['ingredient1'] ?? '',
      quantity1: map['quantity1'] ?? 0.0,
      ingredient2: map['ingredient2'] ?? '',
      quantity2: map['quantity2'] ?? 0.0,
      ingredient3: map['ingredient3'] ?? '',
      quantity3: map['quantity3'] ?? 0.0,
      ingredient4: map['ingredient4'] ?? '',
      quantity4: map['quantity4'] ?? 0.0,
      ingredient5: map['ingredient5'] ?? '',
      quantity5: map['quantity5'] ?? 0.0,
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid ?? '',
      'ingredient1': ingredient1 ?? '',
      'quantity1': quantity1 ?? 0.0,
      'ingredient2': ingredient2 ?? '',
      'quantity2': quantity2 ?? 0.0,
      'ingredient3': ingredient3 ?? '',
      'quantity3': quantity3 ?? 0.0,
      'ingredient4': ingredient4 ?? '',
      'quantity4': quantity4 ?? 0.0,
      'ingredient5': ingredient5 ?? '',
      'quantity5': quantity5 ?? 0.0,
    };
  }
}
