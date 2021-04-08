import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String name;
  String price;
  String street;
  String country;
  String quantity;
  String key;
  String accountName;
  String phone;
  String account;

  OrderModel(
      {
      this.quantity,
      this.name,
      this.price,
      this.country,
      this.account,
      this.phone,
      this.accountName,
      this.key,
      this.street});

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final json = snapshot.data();
    name = json['name'];
    price = json['price'];
    street = json['street'];
    country = json['country'];
    quantity = json['quantity'];
    phone=json['phone'];
    account=json['account'];
    accountName=json['accountName'];
    key = snapshot.id;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    map['street'] = street;
    map['country'] = country;
    map['quantity'] = quantity;
    map['accountName']=accountName;
    map['account']=account;
    map['phone']=phone;
    return map;
  }
}
