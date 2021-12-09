import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailsModel {
  String image;
  String nameFood;
  String name;
  String price;
  String key;

  ProductDetailsModel(
      {this.image, this.name, this.nameFood, this.price, this.key});

  factory ProductDetailsModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ProductDetailsModel(
        image: snapshot['image'],
        name: snapshot['name'],
        nameFood: snapshot['nameFood'],
        price: snapshot['price'],
        key: snapshot.id);
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
