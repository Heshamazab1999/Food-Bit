import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/constant.dart';

class SubContainerDetails extends StatelessWidget {
  final String label;
  final String name;
  final String price;
  final String review;
  final Function function;
  final Color color;

  SubContainerDetails(
      {this.function, this.label, this.price, this.review, this.name,this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 1,
        child: Container(
          height: 350,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                              textAlign: TextAlign.start,
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          AutoSizeText(
                            name,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.aBeeZee(
                                fontSize: 14, color: K.IconColor),
                          ),
                        ],
                      ),
                      AutoSizeText(
                        price,
                        style: GoogleFonts.aBeeZee(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                           SizedBox(
                              height: 40,
                              width: 150,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor:color),
                                onPressed: function,
                                child: Row(
                                  children: [
                                    Text(
                                      "Add To Cart",
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Expanded(
                                        child: Icon(Icons.shopping_cart,color: K.secondColor,))
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Review",
                    style:
                        GoogleFonts.aBeeZee(fontSize: 22, color: K.BlackColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    review,
                    style: GoogleFonts.aBeeZee(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
