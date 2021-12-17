import 'package:flutter/material.dart';
import 'package:mapas_app/screens/screens.dart';

void main() => runApp(const MapsApp());

class MapsApp extends StatelessWidget {
  const MapsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: GpsAccessScreen());
  }
}
