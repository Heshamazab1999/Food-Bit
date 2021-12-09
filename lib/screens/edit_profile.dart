import 'dart:io';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:app/Controller/auth_controller.dart';
import 'package:app/Controller/edit_controller.dart';
import 'package:app/component/Text_field.dart';
import 'package:app/component/octo_image.dart';
import 'package:app/component/raised_button.dart';
import 'package:app/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(EditController());

    return Scaffold(
      backgroundColor: K.secondColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: K.secondColor,
        title: Text(
          "Edit your Profile",
          style: TextStyle(fontSize: 18, color: K.BlackColor),
        ),
        centerTitle: true,
      ),
      body: Obx(() => ModalProgressHUD(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: Container(
                              height: 180,
                              width: 180,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: RawMaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  onPressed: () {
                                    _controller.getImage(context);
                                  },
                                  child: _controller.image != null
                                      ? Image.file(
                                          File(_controller.image),
                                          fit: BoxFit.cover,
                                          height: double.infinity,
                                          width: double.infinity,
                                        )
                                      : LoadImage(
                                          image: AuthController
                                                      .to.currentUser.image !=
                                                  null
                                              ? AuthController
                                                  .to.currentUser.image
                                              : "assets/images/profile.svg",
                                        ))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Name",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Obx(
                          () => CustomTextField(
                            type: TextInputType.emailAddress,
                            inputDecoration: K.textFieldDecorationEdit,
                            hint: AuthController.to.currentUser.name,
                            errorLabel: _controller.name.error,
                            controller: _controller.editingControllerName,
                            fillColor: K.TextFieldColor,
                            color: K.IconColor,
                            onChanged: (name) {
                              _controller.changeName(name);
                            },
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Username",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Obx(
                          () => CustomTextField(
                            type: TextInputType.emailAddress,
                            inputDecoration: K.textFieldDecorationEdit,
                            hint: AuthController.to.currentUser.username,
                            errorLabel: _controller.username.error,
                            controller: _controller.editingControllerUserName,
                            fillColor: K.TextFieldColor,
                            color: K.IconColor,
                            onChanged: (name) {
                              _controller.changeUsername(name);
                            },
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Password",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Obx(() => CustomTextField(
                          type: TextInputType.phone,
                          inputDecoration: K.textFieldDecorationEdit,
                          errorLabel: _controller.password.error,
                          controller: _controller.editingControllerPassword,
                          fillColor: K.TextFieldColor,
                          color: K.IconColor,
                          isPassword: _controller.isPassword,
                          icon: _controller.isPassword
                              ? IconButton(
                                  onPressed: () {
                                    _controller.change();
                                  },
                                  icon: Icon(Icons.visibility))
                              : IconButton(
                                  onPressed: () {
                                    _controller.change();
                                  },
                                  icon: Icon(Icons.visibility_off)),
                          onChanged: (name) {
                            _controller.changePassword(name);
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                      child: Text(
                        "Phone",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Obx(
                          () => IntlPhoneField(
                            keyboardType: TextInputType.number,
                            controller: _controller.editingControllerPhone,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: AuthController.to.currentUser.phone,
                              errorText: _controller.phone.error,
                            ),
                            initialCountryCode: 'EG',
                            onChanged: (x) {
                              _controller.changePhone(x.countryCode + x.number);
                            },
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: Button(
                          color: K.mainColor,
                          colorText: K.secondColor,
                          function: () {
                            _controller.updateUser(context);
                            _controller.editingControllerPhone.clear();
                            _controller.editingControllerPassword.clear();
                            _controller.editingControllerName.clear();
                            _controller.editingControllerUserName.clear();
                          },
                          label: "Edit",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            inAsyncCall: _controller.saving,
          )),
    );
  }
}
