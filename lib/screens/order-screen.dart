import 'package:app/Controller/database_controller.dart';
import 'package:app/Controller/order_status_controller.dart';
import 'package:app/component/loading_widget.dart';
import 'package:app/component/place_holder.dart';
import 'package:app/constant.dart';
import 'package:app/enum/enums.dart';
import 'package:app/screens/location_between.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/component/card_order.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class OrderScreen extends StatelessWidget {
  final _controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: K.secondColor,
          elevation: 0,
          title:  Text(
            "Check Out",
            style: GoogleFonts.aBeeZee(
                fontSize: 25, color: K.BlackColor),
          ),
          centerTitle: true,
        ),
        backgroundColor: K.secondColor,
        body: Obx(
          () => ModalProgressHUD(
            child: (_controller.state == ViewState.busy)
                ? LoadingWidget()
                : Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if ((DataBaseController.to.isData
                                  ? DataBaseController.to.sqlLiteModel.length
                                  : DataBaseController
                                      .to.sqlLiteModel.length) ==
                              0)
                            EmptyPlaceholder(
                              message: "No Product",
                            )
                          else
                            SizedBox(
                                height:200,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(8),
                                    itemCount: DataBaseController
                                        .to.sqlLiteModel.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            CardOrder(
                                              name: DataBaseController
                                                  .to.sqlLiteModel[index].name,
                                              image: DataBaseController
                                                  .to.sqlLiteModel[index].image,
                                            ))),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 25),
                            child: Container(
                              height: 300,
                              child: LocationBetween(
                                zoom: 7,
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    width: 200,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: K.mainColor),
                                      onPressed: () {
                                        _controller.sendOrder();
                                        _controller.sqlLiteModel.clear();
                                      },
                                      child: Text(
                                        'Make Order',
                                        style: GoogleFonts.aBeeZee(
                                            color: K.secondColor, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _controller.launched =
                                          _controller.makePhoneCall(
                                              'tel:${_controller.url}');
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: K.mainColor,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Icon(
                                        (Icons.phone),
                                        size: 25,
                                        color: K.secondColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            inAsyncCall: _controller.saving,
          ),
        ),
      ),
    );
  }
}
