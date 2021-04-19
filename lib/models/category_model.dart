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
    final json = snapshot.data();
    image = json['image'];
    name = json['name'];
    price = json['price'];
    rate = json['rate'];
    review = json['review'];
    label = json['label'];
    isSelect=json["isSelect"];
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
