import 'package:flutter/material.dart';

class Shape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();
    Paint paint = new Paint();
    Path path1 = new Path();
    Paint paint1 = new Paint();
    Path path3 = new Path();
    Paint paint3 = new Paint();
    Path path4 = new Path();
    Paint paint4 = new Paint();
    path.lineTo(0, 200);
    path.quadraticBezierTo(300, 550, 700, 0);
    paint.color = Colors.white70;
    canvas.drawPath(path, paint);
    path1.lineTo(0, 200);
    path1.quadraticBezierTo(300, 500, 650, 0);
    paint1.color = Colors.grey.shade500;
    canvas.drawPath(path1, paint1);
    path3.lineTo(0, 200);
    path3.quadraticBezierTo(300, 450, 600, 0);
    paint3.color = Colors.blueGrey.shade400;
    canvas.drawPath(path3, paint3);
    path4.lineTo(0, 200);
    path4.quadraticBezierTo(300, 400, 550, 0);
    paint4.color = Colors.blueGrey.shade600;
    canvas.drawPath(path4, paint4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
