import 'package:app/component/octo_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shape_of_view/shape_of_view.dart';

class FoodCart extends StatelessWidget {
  final String label;
  final String price;
  final String image;
  final Function delete;
  final Function increase;
  final Function decrease;
  final String quantity;

  FoodCart(
      {this.label,
      this.price,
      this.image,
      this.delete,
      this.decrease,
      this.quantity,
      this.increase});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Material(
        color: Colors.white,
        elevation: 1,
        shadowColor: K.IconColor,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 120,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShapeOfView(
                  width: 100,
                  height: 100,
                  elevation: 3,
                  clipBehavior: Clip.antiAlias,
                  child: LoadImage(
                    image: image,
                    loadImage: "assets/images/profile.svg",
                  ),
                  shape: CircleShape(
                    borderColor: Colors.white, //optional
                    borderWidth: 0.5, //optional
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: AutoSizeText(
                                    label,
                                    maxLines: 1,
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                    width: 100,
                                    child: AutoSizeText(price,
                                        maxLines: 1,
                                        style: GoogleFonts.aBeeZee(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                              ],
                            ),
                            TextButton(
                              onPressed: delete,
                              style: TextButton.styleFrom(),
                              child: Icon(
                                Icons.delete_forever,
                                color: K.mainColor,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: decrease,
                              style: TextButton.styleFrom(),
                              child: Image.asset("assets/images/minus.png",color: K.BlackColor,)),
                          Text(
                            quantity,
                            style: GoogleFonts.aBeeZee(
                                fontSize: 25, color: K.BlackColor),
                          ),
                          TextButton(
                            onPressed: increase,
                            style: TextButton.styleFrom(),
                            child: Icon(
                              Icons.add,
                              color: K.BlackColor,
                              size: 30,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
