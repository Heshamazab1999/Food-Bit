import 'package:flutter/material.dart';
class IncreaseButton extends StatelessWidget {
  final IconData iconData;
  final Function function;
  final Color color;

  IncreaseButton({
    this.iconData,
    this.function,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Icon(
        iconData,
        color: color,
        size: 30,
      ),
    );
  }
}
