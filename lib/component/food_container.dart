import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/component/octo_image.dart';

class FoodContainer extends StatelessWidget {
  final String image;
  final String name;

  FoodContainer({this.image, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Column(
        children: [
          Container(
              clipBehavior: Clip.antiAlias,
              height: 80,
              width:80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: LoadImage(
                image: image,
                loadImage: "assets/images/loading.svg",
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
    );
  }
}