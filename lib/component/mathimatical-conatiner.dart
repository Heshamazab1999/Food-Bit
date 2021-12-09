import 'package:app/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MathematicalContainer extends StatelessWidget {
  final String label;

  MathematicalContainer({this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Material(
          shadowColor: K.IconColor,
          elevation: 2,
          color: K.secondColor,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: K.secondColor, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total",
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      ),
                      Text(
                        label,
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
