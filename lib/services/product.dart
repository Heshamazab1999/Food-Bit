import 'package:app/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final _fireStore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getAllCategory() async {
    final data = await _fireStore.collection("product").get();

    return data.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
  }
}
