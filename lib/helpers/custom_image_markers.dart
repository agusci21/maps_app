import 'package:flutter/material.dart' show ImageConfiguration;
import 'package:google_maps_flutter/google_maps_flutter.dart' show BitmapDescriptor;

Future<BitmapDescriptor> getAssetImageMarker()async =>
  BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(
      devicePixelRatio: 2.5
    ), 
     'assets/custom-pin.png'
  );
