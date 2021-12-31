import 'package:flutter/material.dart';

class StartMarkerPainter extends CustomPainter {
  final int minutes;
  final String destination;

  StartMarkerPainter({required this.minutes, required this.destination});
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
    final textSpan = TextSpan(
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
        text: '$minutes');

    final minutesPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(minWidth: 70, maxWidth: 70);

    minutesPainter.paint(canvas, const Offset(40, 40));

    //Minutos palabra

    const minutesTextSpan = TextSpan(
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        text: 'Min');

    final minutesTextPainter = TextPainter(
      text: minutesTextSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(minWidth: 70, maxWidth: 70);

    minutesTextPainter.paint(canvas, const Offset(40, 68));

    //Descripcion
    final double offsetY = destination.length > 20 ? 35 : 48;

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

    locationPainter.paint(canvas, Offset(120, offsetY));
  }
}
