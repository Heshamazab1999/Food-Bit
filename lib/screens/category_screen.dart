import 'package:app/component/loading_widget.dart';
import 'package:app/component/place_holder.dart';
import 'package:app/enum/enums.dart';
import 'package:app/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:app/component/food_container.dart';
import 'package:app/component/category_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:app/Controller/category_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CategoryScreen extends StatelessWidget {
  final _controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: K.secondColor,
        title: AutoSizeText(
          "What would you like to eat?",
          maxLines: 1,
          style: GoogleFonts.aBeeZee(
              fontSize: 20, fontWeight: FontWeight.bold, color: K.BlackColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications_none_sharp,
              size: 25,
              color: K.IconColor,
            ),
          ),
        ],
      ),
      backgroundColor: K.secondColor,
      body: Obx(
        () => (_controller.state == ViewState.busy)
            ? LoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                            onChanged: (filter) {
                              _controller.onFilter(filter);
                            },
                            decoration: K.textFieldSearchDecoration),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        " Offers",
                        style: GoogleFonts.amiri(
                            fontSize: 30, color: K.BlackColor),
                      ),
                    ),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 180,
                        autoPlay: true,
                      ),
                      itemCount: _controller.product.length,
                      itemBuilder: (context, itemIndex, realIndex) {
                        return FoodContainer(
                          image: _controller.product[itemIndex].image,
                          // name: _controller.product[itemIndex].name,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Text(
                        "Popular Food",
                        style: TextStyle(fontSize: 25, color: K.BlackColor),
                      ),
                    ),
                    if ((_controller.isSearched
                            ? _controller.categorySearch.length
                            : _controller.category.length) ==
                        0)
                      EmptyPlaceholder(
                        message: "Not Found Category",
                      )
                    else
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10
                            ),
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: _controller.isSearched
                                ? _controller.categorySearch.length
                                : _controller.category.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Obx(() => CategoryCard(
                                      function: () {
                                        Get.to(() => ProductDetails(
                                              categoryModel:
                                                  _controller.category[index],
                                            ));
                                      },
                                      image: _controller.isSearched
                                          ? _controller
                                              .categorySearch[index].image
                                          : _controller.category[index].image,
                                      label: _controller.isSearched
                                          ? _controller
                                              .categorySearch[index].name
                                          : _controller.category[index].name,
                                      price: _controller.isSearched
                                          ? _controller
                                              .categorySearch[index].price
                                          : _controller.category[index].price,
                                      rate: _controller.isSearched
                                          ? _controller
                                              .categorySearch[index].rate
                                          : _controller.category[index].rate,
                                    )),
                          )),
                  ],
                ),
              ),
      ),
    ));
  }
}
