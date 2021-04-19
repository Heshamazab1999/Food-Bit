import 'package:app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final Color color;

  LoadingWidget({this.size = 80, this.color = K.mainColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingFour(
        color: color,
        size: size,
      ),
    );
  }
}
