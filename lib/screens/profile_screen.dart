import 'package:app/Controller/auth_controller.dart';
import 'package:app/Controller/profile_controller.dart';
import 'package:app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/component/cointainer_profile_review.dart';
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
          elevation: 0,
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
                Obx(
                  () => Container(
                      height: 150,
                      width: 150,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: LoadImage(
                        image: AuthController.to.currentUser.image != null
                            ? AuthController.to.currentUser.image
                            : "assets/images/profile.svg",
                        loadImage: "assets/images/profile.svg",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: K.mainColor,
                      size: 33,
                    ),
                    Obx(
                      () => SizedBox(
                        height: 50,
                        width: 250,
                        child: AutoSizeText(
                          _controller.address.toString(),
                          maxLines: 5,
                          style: GoogleFonts.aBeeZee(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: ContainerReview()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
