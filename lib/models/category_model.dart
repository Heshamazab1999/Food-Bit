import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String image;
  String name;
  String price;
  String rate;
  String review;
  String label;
  String key;
  bool isSelect;

  CategoryModel(
      {this.image,
      this.name,
      this.price,
      this.key,
      this.rate,
      this.isSelect,
      this.review,
      this.label});

  CategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final Map<String, dynamic> doc = snapshot.data();
    image = doc['image'];
    name = doc['name'];
    price = doc['price'];
    rate = doc['rate'];
    review = doc['review'];
    label = doc['label'];
    isSelect = doc["isSelect"];
    key = snapshot.id;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['image'] = image;
    map['name'] = name;
    map['price'] = price;
    map['rate'] = rate;
    map['review'] = review;
    map['label'] = label;
    return map;
  }
}
