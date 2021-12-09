import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  String image;
  String name;
  String key;

  ReviewModel({this.image, this.name, this.key});

  factory ReviewModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ReviewModel(
      image : snapshot['image'],
      name : snapshot['name'],
      key : snapshot.id,
    );

  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['image'] = image;
    map['name'] = name;
    return map;
  }
}
