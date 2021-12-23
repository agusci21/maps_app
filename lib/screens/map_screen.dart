import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas_app/blocs/blocs.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;
  @override
  void initState() {
    locationBloc = BlocProvider.of<LocationBloc>(context);
    super.initState();
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    super.dispose();
    locationBloc.stopFollowingUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state.lastKnownLocation == null) {
          return const Center(
            child: Text('Por favor, espere'),
          );
        }

       final CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(state.lastKnownLocation!.latitude, state.lastKnownLocation!.longitude),
      zoom: 15);

        return GoogleMap(
          initialCameraPosition: _initialCameraPosition
        );
      },
    ));
  }
}
