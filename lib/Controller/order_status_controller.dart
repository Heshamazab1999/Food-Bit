import 'package:app/Controller/auth_controller.dart';
import 'package:app/Controller/base_controller.dart';
import 'package:app/Controller/database_controller.dart';
import 'package:app/Controller/profile_controller.dart';
import 'package:app/enum/enums.dart';
import 'package:app/models/sqllite_model.dart';
import 'package:app/models/validation_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app/services/order_services.dart';
import 'package:app/models/order_model.dart';

class OrderController extends BaseController {
  OrderServices orderServices = new OrderServices();
  final _sqlLiteModel = <SqlLiteModel>[].obs;
  Future<void> launched;
  final _url = '01004479160'.obs;
  final _name = ''.obs;
  final _image = ''.obs;
  final _street = Valid().obs;
  final _price = ''.obs;
  final _quantity = ''.obs;
  final _selectCountry = Valid().obs;
  RxBool _saving = false.obs;

  String get name => _name.value;

  String get image => _image.value;

  Valid get street => _street.value;

  String get price => _price.value;

  String get quantity => _quantity.value;

  Valid get selectCountry => _selectCountry.value;

  String get url => _url.value;

  List<SqlLiteModel> get sqlLiteModel => _sqlLiteModel;

  bool get saving => _saving.value;

  getCountry(String country) {
    if (country.trim().length < 5) {
      _selectCountry.value = Valid(error: "Enter your Country");
    } else {
      _selectCountry.value = Valid(value: country);
    }
  }

  getStreet(String street) {
    if (street.trim().length < 5) {
      _street.value = Valid(error: "Enter your Street");
    } else {
      _street.value = Valid(value: street);
    }
  }

  @override
  onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    DataBaseController.to.getAllProducts();
    setSate(ViewState.idle);
  }

  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  sendOrder() async {
    _saving.value = true;
    OrderModel orderModel = await orderServices.sendOrder(
      OrderModel(
        name: DataBaseController.to.sqlLiteModel[_sqlLiteModel.length].name,
        quantity: DataBaseController
            .to.sqlLiteModel[_sqlLiteModel.length].quantity
            .toString(),
        price: DataBaseController.to.sqlLiteModel[_sqlLiteModel.length].price,
        country: ProfileController.to.address.capitalizeFirst.toString(),
        street: ProfileController.to.position.toString(),
        account: AuthController.to.currentUser.username,
        accountName: AuthController.to.currentUser.name,
        phone: AuthController.to.currentUser.phone,
      ),
    );
    _saving.value = false;
    DataBaseController.to.deleteAllProduct();
  }
}
