import 'package:app/Controller/database_controller.dart';
import 'package:app/constant.dart';
import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/Controller/base_controller.dart';
import 'package:app/screens/category_screen.dart';
import 'package:app/screens/map_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:badges/badges.dart';

class HomeScreen extends StatelessWidget {
  final _controller = Get.put(BaseController());
  final List<Widget> bodyContent = [
    CategoryScreen(),
    MapScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => Center(
              child: bodyContent.elementAt(_controller.selectedIndex),
            )),
        bottomNavigationBar: Obx(
          () => CustomNavigationBar(
            iconSize: 30.0,
            selectedColor: K.mainColor,
            strokeColor: Color(0x30040307),
            unSelectedColor: Color(0xFF5d6275),
            backgroundColor: Colors.white,
            items: [
              CustomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.location_pin),
                title: Text("Near By"),
              ),
              CustomNavigationBarItem(
                icon:Obx(() => Badge(
                  animationType:
                    BadgeAnimationType.scale,
                    badgeColor: K.mainColor,
                    badgeContent:  Text(
                          DataBaseController.to.sqlLiteModel.length.toString(),
                          style: TextStyle(color: K.secondColor),
                        ),
                    child: Icon(Icons.shopping_cart))),
                title: Text("Cart"),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Me"),
              ),
            ],
            currentIndex: _controller.selectedIndex,
            onTap: (index) => _controller.selectedIndex = index,
          ),
        ),
      ),
    );
  }
}
