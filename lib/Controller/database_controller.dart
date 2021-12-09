import 'package:app/Controller/base_controller.dart';
import 'package:app/constant.dart';
import 'package:app/enum/enums.dart';
import 'package:app/models/sqllite_model.dart';
import 'package:app/splflite/database_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataBaseController extends BaseController {
  static DataBaseController to = Get.find();
  final _isData = true.obs;

  bool get isData => _isData.value;
  List _sqlLiteModel = <SqlLiteModel>[].obs;
  final _totalPrice = 0.0.obs;

  List<SqlLiteModel> get sqlLiteModel => _sqlLiteModel;

  double get totalPrice => _totalPrice.value;

  @override
  void onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    getAllProducts();
    getTotalPrice();
    setSate(ViewState.idle);
  }

  insertProduct(SqlLiteModel sqlLiteModel, BuildContext context) async {
    for (int i = 0; i < _sqlLiteModel.length; i++) {
      if (_sqlLiteModel[i].name == sqlLiteModel.name) {
        return Get.snackbar("", "",
            forwardAnimationCurve: Curves.easeOutBack,
            barBlur: 20,
            titleText: Center(child: Text("Filed")),
            messageText: Center(child: Text("Added Before")),
            snackPosition: SnackPosition.BOTTOM);
      }
    }
    var db = DataBaseServices.db;
    await db.insert(sqlLiteModel);
    _sqlLiteModel.add(sqlLiteModel);
    print(_sqlLiteModel.length);
    _totalPrice.value = 0;
    for (int i = 0; i < _sqlLiteModel.length; i++) {
      _totalPrice.value += double.parse(sqlLiteModel.price);
    }
    print(_totalPrice);
    Get.snackbar("", "",
        forwardAnimationCurve: Curves.easeOutBack,
        backgroundColor: K.SnackColor,
        titleText: Center(
            child: Text(
          "Success",
          style: TextStyle(color: K.secondColor, fontSize: 18),
        )),
        messageText: Center(
            child: Text(
          "Added",
          style: TextStyle(color: K.secondColor, fontSize: 18),
        )),
        snackPosition: SnackPosition.BOTTOM);
    update();
  }

  getAllProducts() async {
    var db = DataBaseServices.db;
    _sqlLiteModel = await db.getAllProduct();
    getTotalPrice();
    update();
    print(_sqlLiteModel.length);
  }

  getTotalPrice() {
    _totalPrice.value = 0;
    for (int i = 0; i < _sqlLiteModel.length; i++) {
      _totalPrice.value +=
          double.parse(_sqlLiteModel[i].price) * _sqlLiteModel[i].quantity;
    }
    print(_totalPrice);
    update();
  }

  deleteProduct(String name) async {
    var db = DataBaseServices.db;
    await db.deleteProduct(name);
    getAllProducts();
    getTotalPrice();
    update();
  }

  incrementQuantity(int index) async {
    var db = DataBaseServices.db;
    _sqlLiteModel[index].quantity++;
    _totalPrice.value += double.parse(_sqlLiteModel[index].price);
    await db.updateQuantity(sqlLiteModel[index]);
    update();
  }

  decrementQuantity(int index) async {
    var db = DataBaseServices.db;
    _sqlLiteModel[index].quantity--;
    _totalPrice.value -= double.parse(_sqlLiteModel[index].price);
    await db.updateQuantity(sqlLiteModel[index]);
    update();
  }

  deleteAllProduct() async {
    var db = DataBaseServices.db;
    await db.deleteAllProduct();
    getAllProducts();
    getTotalPrice();
    update();
  }
}
