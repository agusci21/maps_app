import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas_app/themes/themes.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  GoogleMapController? _mapController;

  set mapController(GoogleMapController? mapController) {
    _mapController = mapController;
  }

  MapBloc() : super(const MapState()) {
    on<OnMapInitializeEvent>(_onInitMap);
  }

  void _onInitMap(OnMapInitializeEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;
    _mapController?.setMapStyle(jsonEncode(assassinsCreedMapTheme));
    emit(state.copyWith(isMapInitialized: true));
  }
}
