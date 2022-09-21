class UserModel {
  String? uid;
  String? username;
  String? email;

  UserModel({
    this.uid,
    this.username,
    this.email,
  });

//data from Server

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      username: map['username'],
      email: map['email'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
    };
  }
}
