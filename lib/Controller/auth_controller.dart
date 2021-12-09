import 'dart:io';
import 'package:app/Controller/base_controller.dart';
import 'package:app/Routes/app_routes.dart';
import 'package:app/enum/enums.dart';
import 'package:app/models/register_model.dart';
import 'package:app/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AuthController extends BaseController {
  static AuthController to = Get.find();
  final _isLogged = false.obs;
  var _currentUser = UserModel().obs;
  final _services = new AuthServices();

  bool get isLogged => _isLogged.value;
  UserModel get currentUser => _currentUser.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    requestImagePermission();
    ever(_isLogged, handelAuthChanged);
    final user = await _services.getCurrentUser();
    if (user != null) {
      _currentUser.value = user;
      _isLogged.value = true;
    } else {
      _isLogged.value = false;
    }
    setSate(ViewState.idle);
  }

  Future<bool> requestImagePermission() async {
    final permissions = await [Permission.location].request();
    if (Platform.isAndroid &&
        permissions[Permission.location].isRestricted) {
      return true;
    } else if (Platform.isIOS &&
        permissions[Permission.location].isRestricted) {
      return true;
    }
    return false;
  }

  handelAuthChanged(isLoggedIn) async {
    await Future.delayed(Duration(seconds: 1));
    if (isLoggedIn) {
      Get.offAllNamed(AppRoute.home_screen);
    } else {
      Get.offAllNamed(AppRoute.login_screen);
    }
  }

  changeLoggedIn(bool isLogged, UserModel user) {
    if (isLogged) {
      _currentUser.value = user;
      Get.offAllNamed(AppRoute.home_screen);
    } else {
      Get.offAllNamed(AppRoute.login_screen);
    }
  }

  logOut() {
    _services.signOut();
  }
}
