import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:mapas_app/blocs/blocs.dart';

class ButtonLocation extends StatelessWidget {
  const ButtonLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
            onPressed: () {
              final LatLng? userLocation = locationBloc.state.lastKnownLocation;
              if (userLocation == null) return;
              mapBloc.moveCamera(userLocation);
            },
            icon: const Icon(
              Icons.my_location_outlined,
              color: Colors.black,
            )),
      ),
    );
  }
}
