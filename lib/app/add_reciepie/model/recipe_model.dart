class ReceipiModel {
  String? uid;
  String? foodname;
  String? description;
  String? time;
  String? veg;
  String? image;
  ReceipiModel({
    this.uid,
    this.foodname,
    this.description,
    this.time,
    this.veg,
    this.image,
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
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'foodname': foodname,
      'time': time,
      'veg': veg,
      'image': image,
    };
  }
}
