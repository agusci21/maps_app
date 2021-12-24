import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas_app/blocs/blocs.dart';
import 'package:mapas_app/themes/themes.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;
  GoogleMapController? _mapController;
  StreamSubscription<LocationState>? locationStateSuscription;

  set mapController(GoogleMapController? mapController) {
    _mapController = mapController;
  }

  MapBloc({required this.locationBloc}) : super(const MapState()) {
    on<OnMapInitializeEvent>(_onInitMap);
    locationStateSuscription = locationBloc.stream.listen((locationState) {
      if (locationState.lastKnownLocation != null) {
        add(OnUpdateUserPolilineEvent(locationState.myLocationHistory));
      }
      if (!state.isFollowingUser) return;
      if (locationState.lastKnownLocation == null) return;

      moveCamera(locationState.lastKnownLocation!);
    });

    on<OnStartFollowingUserEvent>(_onStartFollowingUser);
    on<OnStopFollowingUserEvent>(_onStopFollowingUser);
    on<OnUpdateUserPolilineEvent>(_onPolylineNewPoint);
    on<OnToggleUserRoute>(_onToggleUserRoute);
  }

  void _onInitMap(OnMapInitializeEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;
    _mapController?.setMapStyle(jsonEncode(assassinsCreedMapTheme));
    emit(state.copyWith(isMapInitialized: true));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  void _onStartFollowingUser(
      OnStartFollowingUserEvent event, Emitter<MapState> emit) {
    emit(state.copyWith(isFollowingUser: true));
    if (locationBloc.state.lastKnownLocation == null) return;
    moveCamera(locationBloc.state.lastKnownLocation!);
  }

  void _onStopFollowingUser(
      OnStopFollowingUserEvent event, Emitter<MapState> emit) {
    emit(state.copyWith(isFollowingUser: false));
  }

  void _onPolylineNewPoint(
      OnUpdateUserPolilineEvent event, Emitter<MapState> emit) {
    final myRoute = Polyline(
        polylineId: const PolylineId('myRoute'),
        color: Colors.black,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        points: event.userHistory);

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['myRoute'] = myRoute;

    emit(state.copyWith(polylines: currentPolylines));
  }

  void _onToggleUserRoute(OnToggleUserRoute event, Emitter<MapState> emit) {
    emit(state.copyWith(isShowingMyRoute: !state.isShowingMyRoute));
  }

  @override
  Future<void> close() {
    locationStateSuscription?.cancel();
    return super.close();
  }
}
