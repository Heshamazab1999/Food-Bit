import 'package:app/enum/enums.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final _selectedIndex = 0.obs;

  get selectedIndex => _selectedIndex.value;

  set selectedIndex(index) => _selectedIndex.value = index;
  final _state = ViewState.idle.obs;

  ViewState get state => _state.value;

  setSate(ViewState state) {
    _state.value = state;
  }
}
