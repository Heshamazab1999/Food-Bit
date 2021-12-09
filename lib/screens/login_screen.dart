import 'package:app/component/Text_field.dart';
import 'package:app/component/raised_button.dart';
import 'package:app/constant.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:app/Routes/app_routes.dart';
import 'package:app/Controller/login_controller.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(LoginController());
    return SafeArea(
        child: Scaffold(
          backgroundColor: K.secondColor,
          body: Obx(
                () =>
                ModalProgressHUD(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          SizedBox(
                          width: 180,
                          height: 180,
                          child: Image.asset("assets/images/splash.png")),
                      Text(
                        "Welcome",
                        style:
                        GoogleFonts.pacifico(color: K.mainColor, fontSize: 30),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Obx(
                            () =>
                            CustomTextField(
                              inputDecoration: K.textFieldDecoration,
                              type: TextInputType.name,
                              controller: _controller.editingControllerUserName,
                              onChanged: (username) {
                                _controller.changeUserName(username);
                              },
                              errorLabel: _controller.username.error,
                              label: "Username",
                              color: K.IconColor,
                              fillColor: K.TextFieldColor,
                            ),
                      ),
                      Obx(
                            () =>
                            CustomTextField(
                              inputDecoration: K.textFieldDecoration,
                              type: TextInputType.number,
                              label: "Password",
                              errorLabel: _controller.password.error,
                              controller: _controller.editingControllerPassword,
                              onChanged: (password) {
                                _controller.changePassword(password);
                              },
                              color: K.IconColor,
                              fillColor: K.TextFieldColor,
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
                            ) ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                              width: 300,
                              height: 40,
                              child: Button(
                                label: "Log in",
                                function: () {
                                  _controller.login(context);
                                  _controller.editingControllerPassword.clear();
                                  _controller.editingControllerUserName.clear();
                                },
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Log in with",
                                style: GoogleFonts.aclonica(fontSize: 18),
                              ),
                              SignInButton.mini(
                                buttonType: ButtonType.google,
                                onPressed: () {},
                              ),
                              SignInButton.mini(
                                buttonType: ButtonType.twitter,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an Account ? ",
                                style: GoogleFonts.laila(
                                    fontSize: 18, color: K.IconColor),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoute.register_screen);
                                },
                                child: Text(
                                  "Sign up",
                                  style: GoogleFonts.laila(
                                      fontSize: 20,
                                      color: K.mainColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )
                        ],
                      ),
                    ),
                  ),
                  inAsyncCall: _controller.saving,
                ),
          ),
        ));
  }
}
