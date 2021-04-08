import 'package:app/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String label;
  final Function function;
  final Color color;
  final Color colorText;

  Button(
      {this.label,
      this.function,
      this.color = Colors.white,
      this.colorText = K.mainColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 180,
        child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: K.mainColor
        ),
          onPressed: function,
          child: Text(
            label,
            style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.white),
          ),
        ));
  }
}
