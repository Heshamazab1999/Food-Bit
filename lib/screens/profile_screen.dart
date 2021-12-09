import 'package:app/Controller/auth_controller.dart';
import 'package:app/Controller/profile_controller.dart';
import 'package:app/Routes/app_routes.dart';
import 'package:app/component/container_profiel.dart';
import 'package:app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:app/component/octo_image.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: K.secondColor,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: K.secondColor,
          title: Text(
            "Profile",
            style: GoogleFonts.aBeeZee(color: K.BlackColor, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Obx(
                  () => Container(
                      height: 180,
                      width: 180,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: LoadImage(
                        image: AuthController.to.currentUser.image != null
                            ? AuthController.to.currentUser.image
                            : "assets/images/profile.svg",
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Obx(
                    () => Text(
                      AuthController.to.currentUser.name,
                      style: GoogleFonts.aBeeZee(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: K.mainColor,
                        size: 35,
                      ),
                      Obx(
                        () => SizedBox(
                          height: 50,
                          width: 230,
                          child: Center(
                            child: AutoSizeText(
                              _controller.address != null
                                  ? _controller.address.toString()
                                  : "Your Location",
                              textAlign: TextAlign.center,
                              maxLines: 5,
                              style: GoogleFonts.aBeeZee(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                Column(
                  children: [
                    ProfileContainer(
                      icon: Icons.location_pin,
                      label: "Location",
                      function: () {
                        Get.toNamed(AppRoute.my_location_screen);
                      },
                    ),
                    Divider(
                      color: K.IconColor,
                      endIndent: 20,
                      indent: 20,
                    ),
                    ProfileContainer(
                      icon: Icons.shopping_cart_outlined,
                      label: "Shopping",
                      function: () {
                        Get.toNamed(AppRoute.cart_screen);
                      },
                    ),
                    Divider(
                      color: K.IconColor,
                      endIndent: 20,
                      indent: 20,
                    ),
                    ProfileContainer(
                      icon: Icons.payment,
                      label: "Payment",
                      function: () {
                        Get.toNamed(AppRoute.order_screen);
                      },
                    ),
                    Divider(
                      color: K.IconColor,
                      endIndent: 20,
                      indent: 20,
                    ),
                    ProfileContainer(
                      icon: Icons.settings,
                      label: "More Setting",
                      function: () {
                        Get.toNamed(AppRoute.edit_profile);
                      },
                    ),
                    Divider(
                      color: K.IconColor,
                      endIndent: 20,
                      indent: 20,
                    ),
                    ProfileContainer(
                      icon: Icons.logout,
                      color: K.mainColor,
                      label: "Log Out",
                      function: () {
                        AuthController.to.logOut();
                      },
                    ),
                  ],
                )
                // Row(children: <Widget>[
                //   Expanded(
                //       child: Obx(() => Container(
                //             height: 40,
                //             child: TextButton(
                //                 onPressed: () {
                //                   _controller.swap;
                //                 },
                //                 child: Text(
                //                   "Favourite",
                //                   style: TextStyle(
                //                       fontSize: 20,
                //                       color: _controller.swap
                //                           ? Colors.black
                //                           : Colors.black12),
                //                 )),
                //           ))),
                //   // Obx(
                //   //   () => Expanded(
                //   //       child: Container(
                //   //           height: 40,
                //   //           child: TextButton(
                //   //             onPressed: () {
                //   //               _controller.swap;
                //   //             },
                //   //             child: Text("Setting",
                //   //                 style: TextStyle(
                //   //                     fontSize: 20,
                //   //                     color: _controller.swap != true
                //   //                         ? Colors.black
                //   //                         : Colors.black12)),
                //   //           ))),
                //   // ),
                // ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
