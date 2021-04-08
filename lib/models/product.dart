import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String image;
  String name;
  String key;

  ProductModel({this.image, this.name, this.key});

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    final json = snapshot.data();
    image = json['image'];
    name = json['name'];
    key = snapshot.id;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['image'] = image;
    map['name'] = name;
    return map;
  }
}
