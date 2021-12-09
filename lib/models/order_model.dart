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
      {this.quantity,
      this.name,
      this.price,
      this.country,
      this.account,
      this.phone,
      this.accountName,
      this.key,
      this.street});

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    return OrderModel(
        name: snapshot['name'],
        price: snapshot['price'],
        street: snapshot['street'],
        country: snapshot['country'],
        quantity: snapshot['quantity'],
        phone: snapshot['phone'],
        account: snapshot['account'],
        accountName: snapshot['accountName'],
        key: snapshot.id);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    map['street'] = street;
    map['country'] = country;
    map['quantity'] = quantity;
    map['accountName'] = accountName;
    map['account'] = account;
    map['phone'] = phone;
    return map;
  }
}
