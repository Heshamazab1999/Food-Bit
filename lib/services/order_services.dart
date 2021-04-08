import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/models/order_model.dart';

class OrderServices {
  final _fireStore = FirebaseFirestore.instance;

  Future<OrderModel> sendOrder(OrderModel orderModel) async {
    try {
      final data =
          await _fireStore.collection("order").add(orderModel.toJson());
      orderModel.key = data.id;
    } catch (e) {
      print(e);
    }
    return orderModel;
  }
}
