import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailsModel {
  String image;
  String nameFood;
  String name;
  String price;
  String key;

  ProductDetailsModel({this.image, this.name,this.nameFood, this.price, this.key});

  ProductDetailsModel.fromSnapshot(DocumentSnapshot snapshot) {
    final json = snapshot.data();
    image = json['image'];
    name = json['name'];
    nameFood = json['nameFood'];
    price = json['price'];
    key = snapshot.id;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['image'] = image;
    map['name'] = name;
    map['nameFood'] = nameFood;
    map['price'] = price;
    return map;
  }
}
