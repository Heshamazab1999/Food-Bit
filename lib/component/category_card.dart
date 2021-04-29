import 'package:flutter/material.dart';
import 'package:app/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/component/octo_image.dart';
import 'package:show_up_animation/show_up_animation.dart';

class CategoryCard extends StatelessWidget {
  final String label;
  final String price;
  final String image;
  final String rate;
  final Function function;
  final Function functionIcon;
  final Color color;

  CategoryCard(
      {this.functionIcon,
      this.label,
      this.price,
      this.image,
      this.function,
      this.color,
      this.rate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:5,horizontal: 8),
      child: GestureDetector(
        onTap: function,
        child: ShowUpAnimation(
          delayStart: Duration(milliseconds:800),
          animationDuration: Duration(milliseconds: 800),
          curve: Curves.easeOut,
          direction: Direction.horizontal,
          offset: 0.5,
          child: Material(
            elevation: 1,
            shadowColor:K.IconColor,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: functionIcon,
                          child: Icon(
                            Icons.favorite,
                            color: color,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: ShapeOfView(
                        elevation: 1,
                        clipBehavior: Clip.antiAlias,
                        child: LoadImage(
                          image: image,
                          loadImage: "assets/images/loading.svg",
                        ),
                        shape: CircleShape(
                          borderColor: Colors.white, //optional
                          borderWidth: 0.5, //optional
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 100,
                              child: AutoSizeText(label,
                                  maxLines: 1,
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                            Icon(
                              Icons.near_me,
                              color: K.mainColor,
                              size: 25,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AutoSizeText(
                                  rate,
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 18, color: K.BlackColor),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 25,
                                  color: K.mainColor,
                                )
                              ],
                            ),
                            SizedBox(
                                child: AutoSizeText(
                              '\$ $price',
                              maxLines: 1,
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 18,
                                  color: K.BlackColor,
                                  fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
