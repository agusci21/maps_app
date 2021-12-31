import 'package:flutter/material.dart';
import 'package:mapas_app/widgets/widgets.dart';

class TestMarkerScreen extends StatelessWidget {
  const TestMarkerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: 350,
            height: 150,
            child: CustomPaint(
              painter: EndMarkerPainter(destination: 'Casa ', kilometers: 25),
            )),
      ),
    );
  }
}
