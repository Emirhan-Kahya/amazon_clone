import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class CustomDot extends CustomPainter {
  double dotLength1, dotLength2, radius, left, top, height;
  Color color;

  CustomDot({
    this.color = Colors.grey,
    this.dotLength1 = 10,
    this.dotLength2 = 10,
    this.radius = 15,
    this.height = 20,
    this.top = 20,
    this.left = 20,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    //left - top - width - height
    Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, height, size.width, size.height - height),
          Radius.circular(radius),
        ),
      );

    // option for amount of dot
    canvas.drawPath(
      dashPath(
        path,
        dashArray: CircularIntervalList<double>(<double>[dotLength1, dotLength2]),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
