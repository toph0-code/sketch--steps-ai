import 'package:flutter/material.dart';

class LoomisOverlay extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 3),
      80,
      paint,
    );

    canvas.drawLine(
      Offset(size.width / 2, 30),
      Offset(size.width / 2, 250),
      paint,
    );

    canvas.drawLine(
      Offset(60, 140),
      Offset(240, 140),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
