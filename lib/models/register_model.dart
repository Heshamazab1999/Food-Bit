import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String image;
  String name;
  String username;
  String phone;
  String password;
  String key;

  UserModel(
      {this.image,
        this.name,
        this.phone,
        this.password,
        this.username,
        this.key});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final json = snapshot.data();
    image = json["image"];
    name = json["name"];
    phone = json["phone"];
    username = json["username"];
    password = json["password"];
    key = snapshot.id;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["image"] = image;
    map["name"] = name;
    map["phone"] = phone;
    map["username"] = username;
    map["password"] = password;
    return map;
  }
}
