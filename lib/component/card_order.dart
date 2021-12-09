import 'package:app/component/octo_image.dart';
import 'package:app/constant.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

class CardOrder extends StatelessWidget {
  final String image;
  final String name;

  CardOrder({this.image, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Material(
          elevation: 1,
          shadowColor: K.IconColor,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 140,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: K.secondColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    clipBehavior: Clip.antiAlias,
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: LoadImage(
                      image: image,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedBox(
                    width: 70,
                    child: AutoSizeText(
                      name,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
