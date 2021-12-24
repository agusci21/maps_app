import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas_app/blocs/blocs.dart';

class MapView extends StatelessWidget {
  final Set<Polyline> polylines;
  final LatLng initialLocation;
  const MapView(
      {Key? key, required this.initialLocation, required this.polylines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final size = MediaQuery.of(context).size;
    final CameraPosition initialCameraPosition = CameraPosition(
        target: LatLng(initialLocation.latitude, initialLocation.longitude),
        zoom: 15);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Listener(
        onPointerMove: (pointerMoveEvent) =>
            mapBloc.add(OnStopFollowingUserEvent()),
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          compassEnabled: false,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          polylines: polylines,
          onMapCreated: (controller) =>
              mapBloc.add(OnMapInitializeEvent(controller)),

          //TODO makers, Polylines, mapa moviendose
        ),
      ),
    );
  }
}
