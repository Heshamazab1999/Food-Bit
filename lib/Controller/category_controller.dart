import 'package:app/Controller/base_controller.dart';
import 'package:app/enum/enums.dart';
import 'package:app/models/category_model.dart';
import 'package:app/models/product.dart';
import 'package:get/get.dart';
import 'package:app/services/category_services.dart';
import 'package:app/services/product.dart';

class CategoryController extends BaseController {
  CategoryServices _services = new CategoryServices();

  ProductService _service = new ProductService();

  final _product = <ProductModel>[].obs;

  final _category = <CategoryModel>[].obs;

  final _categorySearch = <CategoryModel>[].obs;

  final _isSearched = false.obs;
  final _isSelected = false.obs;

  List<ProductModel> get product => _product;

  List<CategoryModel> get category => _category;

  List<CategoryModel> get categorySearch => _categorySearch;

  bool get isSearched => _isSearched.value;

  bool get isSelected => _isSelected.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    _category.assignAll(await _services.getAllCategory());
    _product.assignAll(await _service.getAllCategory());
    setSate(ViewState.idle);
  }

  setState(bool isLike) {
    if (isLike = true) {
      _isSelected.value = isLike;
    } else if (isLike = false) {
      _isSelected.value = false;
    }
  }

  onFilter(String string) {
    _categorySearch.clear();
    if (string.isEmpty) {
      _categorySearch.add(null);
      _isSearched.value = false;
    } else {
      _isSearched.value = true;
      _categorySearch.addAll(_category
          .where((e) =>
              e.name.trim().toLowerCase().contains(string.trim().toLowerCase()))
          .toList());
    }
  }
}
