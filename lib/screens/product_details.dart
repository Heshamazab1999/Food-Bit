import 'package:app/Controller/database_controller.dart';
import 'package:app/Controller/profile_controller.dart';
import 'package:app/Routes/app_routes.dart';
import 'package:app/constant.dart';
import 'package:app/models/category_model.dart';
import 'package:app/models/sqllite_model.dart';
import 'package:flutter/material.dart';
import 'package:app/component/container_product_details.dart';
import 'package:app/component/sub_container_product_details.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProductDetails extends StatelessWidget {
  final CategoryModel categoryModel;

  ProductDetails({this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: K.secondColor,
            body: Obx(
              () => SingleChildScrollView(
                child: Column(
                  children: [
                    ProductDetailsContainer(
                      image: categoryModel.image,
                    ),
                    SubContainerDetails(
                      function: () {
                        DataBaseController.to.insertProduct(
                            SqlLiteModel(
                              name: categoryModel.name,
                              price: categoryModel.price,
                              image: categoryModel.image,
                              quantity: 1,
                            ),
                            context);
                      },
                      label: categoryModel.name,
                      price: '\$ ${categoryModel.price}',
                      name: categoryModel.label,
                      review: categoryModel.review,
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 35,
                                color: Colors.blue[900],
                              ),
                              Row(
                                children: [
                                  Text(
                                      ProfileController.to.now.hour.toString()),
                                  Text(":"),
                                  Text(ProfileController.to.now.minute
                                      .toString()),
                                  Text(":"),
                                  Text(ProfileController.to.now.second
                                      .toString()),
                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 35,
                                color: Color(0xFF2fc890),
                              ),
                              SizedBox(
                                width: 80,
                                child: AutoSizeText(
                                    "${ProfileController.to.distance.toInt().toString()}Km",
                                    maxLines: 1,
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 20,
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoute.location_between_screen);
                                },
                                child: Icon(
                                  Icons.map,
                                  size: 35,
                                  color: Color(0xFFff0b55),
                                ),
                              ),
                              Text("Map View")
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoute.order_screen);
                                },
                                child: Icon(
                                  Icons.delivery_dining,
                                  size: 35,
                                  color: K.mainColor,
                                ),
                              ),
                              Text("Delivery")
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
