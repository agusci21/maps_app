import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas_app/blocs/blocs.dart';
import 'package:mapas_app/views/views.dart';
import 'package:mapas_app/widgets/widgets.dart';

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
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.lastKnownLocation == null) {
            return const Center(
              child: Text('Por favor, espere'),
            );
          }

          return SingleChildScrollView(
            child: Stack(
              children: [
                //TODO Crear botones
                MapView(
                  initialLocation: state.lastKnownLocation!,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          ButtonLocation(),
        ],
      ),
    );
  }
}
