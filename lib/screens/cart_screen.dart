import 'package:app/Controller/database_controller.dart';
import 'package:app/Routes/app_routes.dart';
import 'package:app/component/loading_widget.dart';
import 'package:app/component/place_holder.dart';
import 'package:app/enum/enums.dart';
import 'package:flutter/material.dart';
import 'package:app/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/component/food_cart.dart';
import 'package:app/component/mathimatical-conatiner.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
class CartScreen extends StatelessWidget {
  final _controller = Get.put(DataBaseController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Item Cart",
          style: GoogleFonts.aBeeZee(color: K.BlackColor, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: badges.Badge(
                badgeContent: Text(
                  DataBaseController.to.sqlLiteModel.length.toString(),
                  style: TextStyle(color: K.secondColor),
                ),
                child: Icon(
                Icons.shopping_cart_outlined,
                color: K.mainColor,
                size: 30,
              ),
            ),
            )),
          SizedBox(width: 10,),
        ],
      ),
      body: Obx(
        () => (_controller.state == (ViewState.busy))
            ? LoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 30),
                      child: Text(
                        "Your Food Cart",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 24,
                            color: K.BlackColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    if ((DataBaseController.to.isData
                            ? DataBaseController.to.sqlLiteModel.length
                            : DataBaseController.to.sqlLiteModel.length) ==
                        0)
                      EmptyPlaceholder(
                        message: "No Product",
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _controller.sqlLiteModel.length,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) =>
                              FoodCart(
                            decrease: () {
                              _controller.decrementQuantity(index);
                            },
                            increase: () {
                              _controller.incrementQuantity(index);
                            },
                            quantity: _controller.sqlLiteModel[index].quantity
                                .toString(),
                            delete: () {
                              _controller.deleteProduct(
                                  _controller.sqlLiteModel[index].name);
                              print(_controller.sqlLiteModel.length);
                            },
                            image: _controller.sqlLiteModel[index].image,
                            label: _controller.sqlLiteModel[index].name,
                            price:
                                '\$ ${_controller.sqlLiteModel[index].price}',
                          ),
                        )),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: MathematicalContainer(
                        label: '\$ ${_controller.totalPrice}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Center(
                        child: SizedBox(
                          width: 300,
                          height: 40,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(AppRoute.order_screen);
                              },
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: K.mainColor),
                              child: Text(
                                "Check Order",
                                style: GoogleFonts.aBeeZee(
                                    color: K.secondColor, fontSize: 20),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    ));
  }
}
