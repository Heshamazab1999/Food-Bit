import 'package:app/Controller/base_controller.dart';
import 'package:app/enum/enums.dart';
import 'package:app/models/product.dart';
import 'package:app/services/product.dart';
import 'package:get/get.dart';

class ProductController extends BaseController {
  ProductService _services = new ProductService();

  final _product = <ProductModel>[].obs;
  final _productSearch = <ProductModel>[].obs;
  final _isSearched = false.obs;

  List<ProductModel> get category => _product;

  List<ProductModel> get categorySearch => _productSearch;

  bool get isSearched => _isSearched.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    _product.assignAll(await _services.getAllCategory());
    setSate(ViewState.idle);
  }

  onFilterProduct(String string) {
    _productSearch.clear();
    if (string.isEmpty) {
      _productSearch.add(null);
      _isSearched.value = false;
    } else {
      _isSearched.value = true;
      _productSearch.addAll(_product
          .where((e) =>
              e.name.trim().toLowerCase().contains(string.trim().toLowerCase()))
          .toList());
    }
  }
}
