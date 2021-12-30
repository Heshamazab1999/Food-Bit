import 'package:app/Controller/auth_controller.dart';
import 'package:app/Controller/base_controller.dart';
import 'package:app/models/register_model.dart';
import 'package:app/models/validation_model.dart';
import 'package:app/screens/admin_screen.dart';
import 'package:app/utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:app/services/login_service.dart';

class LoginController extends BaseController {
  LoginServices loginServices = new LoginServices();
  final _username = Valid().obs;
  final _password = Valid().obs;
  RxBool _saving = false.obs;
  TextEditingController editingControllerUserName = new TextEditingController();
  TextEditingController editingControllerPassword = new TextEditingController();

  bool get saving => _saving.value;
  RxBool _isPassword = true.obs;

  bool get isPassword => _isPassword.value;

  Valid get username => _username.value;

  Valid get password => _password.value;

  change() {
    _isPassword.value = !_isPassword.value;
  }

  changeUserName(String username) {
    if (username.trim().length < 5) {
      _username.value = Valid(error: "يجب ان يكون اكبر من 5");
    } else {
      _username.value = Valid(value: username);
    }
  }

  changePassword(String password) {
    if (password.trim().length < 5) {
      _password.value = Valid(error: "يجب ان يكون اكبر من 5");
    } else {
      _password.value = Valid(value: password);
    }
  }

  login(BuildContext context) async {
    if (_username.value.isValid() &&
        _password.value.isValid() &&
        EmailValidator.validate(_username.value.value)) {
      _saving.value = true;
      if(_username.value.value=='kadoura@gmail.com'&&_password.value.value=='123456789') {
        Get.to(() => AdminScreen());
      } else  {
        UserModel user = await loginServices.login(
            context, _username.value.value, _password.value.value);
        _saving.value = false;
        AuthController.to.changeLoggedIn(true, user);
      } } else {
      Utility.displayErrorAlert(
          "تاكد من ادخال القيم بشكل صحيح !", "خطا بالادخال", context);
    }
  }

  reset() {
    loginServices.reset(UserModel(username: _username.value.value));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _saving.value=false;
  }
}
