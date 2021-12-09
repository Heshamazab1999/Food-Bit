import 'package:flutter/material.dart';
import 'package:app/component/octo_image.dart';
import 'package:show_up_animation/show_up_animation.dart';

class FoodContainer extends StatelessWidget {
  final String image;
  final String name;

  FoodContainer({this.image, this.name});

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: Duration(milliseconds: 800),
      animationDuration: Duration(milliseconds: 800),
      curve: Curves.easeOut,
      direction: Direction.vertical,
      offset: 0.5,
      child: Container(
          width: 300,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: LoadImage(
            image: image,
          )),
    );
  }
}
