import 'package:flutter/material.dart';

class StartMarkerPainter extends CustomPainter {
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
  @override
  void paint(Canvas canvas, Size size) {
    const double radius = 20;
    final paint = Paint()..color = Colors.black;
    canvas.drawCircle(Offset(radius, size.height - radius), radius, paint);
  }
}
