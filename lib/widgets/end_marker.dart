import 'package:flutter/material.dart';

class EndMarkerPainter extends CustomPainter {
  final int kilometers;
  final String destination;

  EndMarkerPainter({required this.kilometers, required this.destination});
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
    canvas.drawCircle(Offset(size.width / 2, size.height - blackRadius),
        blackRadius, paintBlack);

    canvas.drawCircle(Offset(size.width / 2, size.height - blackRadius),
        whiteRadius, paintWithe);

    //Sombra
    canvas.drawShadow(path, Colors.black, 10, false);

    // Cuadrado Blanco
    path.moveTo(10, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(10, 100);
    canvas.drawPath(path, paintWithe);

    //Caja Negra
    const blackBox = Rect.fromLTWH(10, 20, 70, 80);
    canvas.drawRect(blackBox, paintBlack);

    final textSpan = TextSpan(
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
        text: '$kilometers');

    final minutesPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(minWidth: 70, maxWidth: 70);

    minutesPainter.paint(canvas, const Offset(10, 40));

    //Minutos palabra

    const minutesTextSpan = TextSpan(
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        text: 'km');

    final minutesTextPainter = TextPainter(
      text: minutesTextSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(minWidth: 70, maxWidth: 70);

    minutesTextPainter.paint(canvas, const Offset(10, 68));

    //Descripcion
    final double offsetY = destination.length > 25 ? 35 : 48;

    final locationText = TextSpan(
        style: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        text: destination);

    final locationPainter = TextPainter(
      maxLines: 2,
      ellipsis: '...',
      text: locationText,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(minWidth: size.width - 135, maxWidth: size.width - 135);

    locationPainter.paint(canvas, Offset(90, offsetY));
  }
}
