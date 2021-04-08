import 'dart:io';
import 'package:app/Controller/base_controller.dart';
import 'package:app/models/register_model.dart';
import 'package:app/models/validation_model.dart';
import 'package:app/services/register_services.dart';
import 'package:app/utility/utility.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/Controller/auth_controller.dart';
class RegisterController extends BaseController {
  static RegisterController to = Get.find();
  SignUpServices services = new SignUpServices();
  final _name = Valid().obs;
  final _phone = Valid().obs;
  final _password = Valid().obs;
  final _username = Valid().obs;
  final _image = Rx<String>(null);
  final _imagePicker = ImagePicker();
  TextEditingController editingControllerName = new TextEditingController();
  TextEditingController editingControllerPhone = new TextEditingController();
  TextEditingController editingControllerPassword = new TextEditingController();
  TextEditingController editingControllerUserName = new TextEditingController();

  RxBool _saving = false.obs;

  bool get saving => _saving.value;

  Valid get name => _name.value;

  Valid get phone => _phone.value;

  Valid get password => _password.value;

  Valid get username => _username.value;

  String get image => _image.value;

  changeName(String name) {
    if (name.trim().length < 5) {
      _name.value = Valid(error: "يجب ان يكون اكبر من 5");
    } else {
      _name.value = Valid(value: name);
    }
  }

  changePhone(String phone) {
    if (phone.trim().length < 5) {
      _phone.value = Valid(error: "يجب ان يكون اكبر من 5");
    } else {
      _phone.value = Valid(value: phone.toString());
    }
  }

  changePassword(String password) {
    if (password.trim().length < 5) {
      _password.value = Valid(error: "يجب ان يكون اكبر من 5");
    } else {
      _password.value = Valid(value: password);
    }
  }

  changeUsername(String username) {
    if (username.trim().length < 5) {
      _username.value = Valid(error: "يجب ان يكون اكبر من 5");
    } else {
      _username.value = Valid(value: username);
    }
  }

  Future<bool> requestImagePermission() async {
    final permissions = await [Permission.storage, Permission.photos].request();
    if (Platform.isAndroid && permissions[Permission.storage].isGranted) {
      return true;
    } else if (Platform.isIOS && permissions[Permission.photos].isGranted) {
      return true;
    }
    return false;
  }

  getImage(BuildContext context) async {
    final state = await requestImagePermission();
    if (state) {
      try {
        PickedFile pickedFile =
        await _imagePicker.getImage(source: ImageSource.gallery);
        if (pickedFile != null) _image.value = pickedFile.path;
      } catch (e) {
        print(e.toString());
      }
    } else {
      Utility.displayErrorAlert("تاكد من الموافقه على صلاحيات الوصول للصور",
          "خطا بالصلاحيات", context);
    }
  }

  registerValidation(BuildContext context) async {
    if (_name.value.isValid() &&
        _phone.value.isValid() &&
        _password.value.isValid() &&
        _username.value.isValid() &&
        EmailValidator.validate(_username.value.value)) {
      _saving.value = true;

      UserModel user = await services.register(
          UserModel(
              name: name.value,
              password: password.value,
              phone: phone.value,
              username: username.value,
              image: image),
          image);
      _saving.value = false;

      AuthController.to.changeLoggedIn(true, user);
    } else {
      Utility.displayErrorAlert(
          "تاكد من ادخال القيم بشكل صحيح !", "خطا بالادخال", context);
    }
  }
}
