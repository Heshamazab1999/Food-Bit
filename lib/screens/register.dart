import 'dart:io';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:app/Controller/register_controller.dart';
import 'package:app/component/Text_field.dart';
import 'package:app/component/raised_button.dart';
import 'package:app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import 'package:app/Routes/app_routes.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(RegisterController());
    return SafeArea(
      child: Scaffold(
          backgroundColor: K.secondColor,
          body: Obx(() => ModalProgressHUD(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 120,
                                  height: 80,
                                  child:
                                      Image.asset("assets/images/splash.png")),
                              Text(
                                "Food Bit",
                                style: GoogleFonts.pacifico(
                                    fontSize: 30, color: K.mainColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Obx(
                            () => Center(
                              child: Container(
                                  height: 120,
                                  width: 120,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: RawMaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
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
                                          : SvgPicture.asset(
                                              "assets/images/profile.svg",
                                              fit: BoxFit.cover,
                                            ))),
                            ),
                          ),
                        ),
                        Obx(
                          () => CustomTextField(
                            inputDecoration: K.textFieldDecoration,
                            label: "Full Name",
                            errorLabel: _controller.name.error,
                            controller: _controller.editingControllerName,
                            fillColor: K.TextFieldColor,
                            color: K.IconColor,
                            onChanged: (name) {
                              _controller.changeName(name);
                            },
                          ),
                        ),
                        Obx(
                          () => CustomTextField(
                            inputDecoration: K.textFieldDecoration,
                            label: "Email Address",
                            color: K.IconColor,
                            controller: _controller.editingControllerUserName,
                            errorLabel: _controller.username.error,
                            fillColor: K.TextFieldColor,
                            onChanged: (username) {
                              _controller.changeUsername(username);
                            },
                          ),
                        ),
                        Obx(
                          () => CustomTextField(
                            inputDecoration: K.textFieldDecoration,
                            label: "Password",
                            type: TextInputType.number,
                            errorLabel: _controller.password.error,
                            fillColor: K.TextFieldColor,
                            controller: _controller.editingControllerPassword,
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
                            onChanged: (password) {
                              _controller.changePassword(password);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 4),
                          child: Obx(
                            () => IntlPhoneField(
                              keyboardType: TextInputType.number,
                              controller: _controller.editingControllerPhone,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "phone number",
                                errorText: _controller.phone.error,
                              ),
                              initialCountryCode: 'EG',
                              onChanged: (x) {
                                _controller
                                    .changePhone(x.countryCode + x.number);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: SizedBox(
                                width: 300,
                                height: 40,
                                child: Button(
                                  label: "Register",
                                  function: () {
                                    _controller.registerValidation(context);
                                    _controller.editingControllerName.clear();
                                    _controller.editingControllerPassword
                                        .clear();
                                    _controller.editingControllerPhone.clear();
                                    _controller.editingControllerUserName
                                        .clear();
                                  },
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already a member / ",
                                style: GoogleFonts.laila(
                                    fontSize: 18, color: K.IconColor),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoute.login_screen);
                                },
                                child: Text(
                                  "log in",
                                  style: GoogleFonts.laila(
                                      fontSize: 25, color: K.mainColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                inAsyncCall: _controller.saving,
              ))),
    );
  }
}
