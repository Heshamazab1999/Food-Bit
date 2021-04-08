import 'package:app/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileContainer extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function function;
  final Color color;

  ProfileContainer(
      {this.label, this.icon, this.function, this.color = K.IconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: function,
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          label,
          style: GoogleFonts.aBeeZee(color: K.BlackColor, fontSize: 20),
        ),
      ),
    );
  }
}
