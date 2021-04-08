import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/constant.dart';

class CreditContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:5, horizontal: 30),
      child: GestureDetector(
        onTap: () {
        },
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.credit_card_outlined,
                  color: K.mainColor,
                  size: 38,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Credit/Debit Card",
                    style: GoogleFonts.aBeeZee(fontSize: 22),
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
