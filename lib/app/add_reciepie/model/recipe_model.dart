class ModelModel {
  String? uid;
  String? foodname;
  String? description;
  num? time;
  bool? veg;
  ModelModel({
    this.uid,
    this.foodname,
    this.description,
    this.time,
    this.veg,
  });

//data from Server

  factory ModelModel.fromMap(Map<String, dynamic> map) {
    return ModelModel(
      uid: map['uid'],
      foodname: map['foodname'],
      description: map['description'],
      time: map['time'],
      veg: map['veg'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'foodname': foodname,
      'time': time,
      'veg': veg,
    };
  }
}
