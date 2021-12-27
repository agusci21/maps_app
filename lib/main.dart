import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mapas_app/blocs/blocs.dart';
import 'package:mapas_app/screens/screens.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => GpsBloc(),
      ),
      BlocProvider(
        create: (BuildContext context) => LocationBloc(),
      ),
      BlocProvider(
        create: (BuildContext context) =>
            MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context)),
      ),
      BlocProvider(
        create: (BuildContext context) => SearchBloc(),
      ),
    ],
    child: const MapsApp(),
  ));
}

class MapsApp extends StatelessWidget {
  const MapsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LoadingScreen());
  }
}
