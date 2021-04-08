import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../constant.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Function(String value) onChanged;
  final double padding;
  final String errorLabel;
  final TextInputType type;
  final TextEditingController controller;
  final Function() onTap;
  final int maxLines;
  final bool isReadOnly;
  final String initialValue;
  final bool isPassword;
  final Color errorColor;
  final Icon icon;
  final String hint;
  final Color color;
  final Color fillColor;

  CustomTextField(
      {this.padding,
      this.fillColor,
      this.hint,
      this.onChanged,
      this.label,
      this.errorLabel,
      this.controller,
      this.onTap,
      this.initialValue,
      this.isPassword = false,
      this.errorColor = Colors.red,
      this.type = TextInputType.text,
      this.maxLines = 1,
      this.icon,
      this.color,
      this.isReadOnly = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:40, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 43,
            child: TextFormField(
                cursorColor: Colors.black,
                cursorHeight: 30,
                initialValue: initialValue,
                style: K.textFieldTextStyle.copyWith(

                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
                keyboardType: type,
                controller: controller,
                onTap: onTap,
                obscureText: isPassword,
                textAlign: TextAlign.center,
                decoration: K.textFieldDecoration.copyWith(
                  filled: true,
                  suffixIcon: icon,
                  hintText: hint,
                  labelText: label,
                  fillColor: fillColor,
                  labelStyle: TextStyle(color: color,),
                  contentPadding:
                      EdgeInsets.only(left: padding != null ? padding : 8),
                ),
                onChanged: onChanged),
          ),
          if (errorLabel != null && errorLabel.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ShowUpAnimation(
                child: Text(
                  '$errorLabel',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.redAccent[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
