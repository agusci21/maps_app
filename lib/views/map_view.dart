import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  const MapView({Key? key, required this.initialLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final CameraPosition _initialCameraPosition = CameraPosition(
        target: LatLng(initialLocation.latitude, initialLocation.longitude),
        zoom: 15);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        compassEnabled: false,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        myLocationEnabled: false,

        //TODO makers, Polylines, mapa moviendose
      ),
    );
  }
}
