import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class paintertriangle extends CustomPaint {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    final path = Path();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
