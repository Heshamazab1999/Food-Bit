import 'package:app/Controller/auth_controller.dart';
import 'package:app/Controller/profile_controller.dart';
import 'package:app/Routes/app_routes.dart';
import 'package:app/component/category_card.dart';
import 'package:app/component/container_profiel.dart';
import 'package:app/component/place_holder.dart';
import 'package:app/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ContainerReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: K.secondColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: K.secondColor,
          bottom: TabBar(
            indicatorColor: K.mainColor,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Favourite",
                  style: GoogleFonts.aBeeZee(color: K.BlackColor, fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "Setting",
                  style: GoogleFonts.aBeeZee(color: K.BlackColor, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  if ((ProfileController.to.isData
                          ? ProfileController.to.favouriteModel.length
                          : ProfileController.to.favouriteModel.length) ==
                      0)
                    EmptyPlaceholder(
                      message: "No Product",
                    )
                  else
                    StaggeredGridView.countBuilder(
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.count(2, index.isOdd ? 2.8 : 2.9),
                        mainAxisSpacing: 1,
                        padding: EdgeInsets.all(10),
                        crossAxisSpacing: 1,
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: ProfileController.to.favouriteModel.length,
                        itemBuilder: (BuildContext context, int index) =>
                            CategoryCard(
                              functionIcon: () {},
                              function: () {},
                              color: K.mainColor,
                              image: ProfileController
                                  .to.favouriteModel[index].image,
                              label: ProfileController
                                  .to.favouriteModel[index].name,
                              price: ProfileController
                                  .to.favouriteModel[index].price,
                              rate: ProfileController
                                  .to.favouriteModel[index].rate
                                  .toString(),
                            )),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
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
                    icon: Icons.logout,
                    color: K.mainColor,
                    label: "Log Out",
                    function: () {
                      AuthController.to.logOut();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
