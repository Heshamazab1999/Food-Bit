import 'package:app/component/octo_image.dart';
import 'package:flutter/material.dart';

class ProductDetailsContainer extends StatelessWidget {
  final String image;
  ProductDetailsContainer({this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      child: LoadImage(
        image: image,
        loadImage: "assets/images/loading.svg",
      ),
    );
  }
}
