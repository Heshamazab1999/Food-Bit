import 'dart:async';
import 'package:app/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryServices {
  final _fireStore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategory() async {
    final data = await _fireStore.collection("category").get();
    return data.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
  }

  Stream<List<CategoryModel>> getAllCategoryStream() {
    return _fireStore
        .collection("category")
        .snapshots()
        .transform(StreamTransformer.fromHandlers(handleData: (data, sink) {
      sink.add(data.docs.map((e) => CategoryModel.fromSnapshot(e)).toList());
    }));
  }
}
