import 'package:flutter/material.dart';

class StartMarkerPainter extends CustomPainter {
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    const double blackRadius = 20;
    const double whiteRadius = 7;
    final paintBlack = Paint()..color = Colors.black;
    final paintWithe = Paint()..color = Colors.white;

    //Circulos
    canvas.drawCircle(Offset(blackRadius, size.height - blackRadius),
        blackRadius, paintBlack);

    canvas.drawCircle(Offset(blackRadius, size.height - blackRadius),
        whiteRadius, paintWithe);

    //Sombra
    canvas.drawShadow(path, Colors.black, 10, false);

    // Cuadrado Blanco
    path.moveTo(40, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(40, 100);
    canvas.drawPath(path, paintWithe);

    //Caja Negra
    const blackBox = Rect.fromLTWH(40, 20, 70, 80);
    canvas.drawRect(blackBox, paintBlack);

    //Textos
  }
}
