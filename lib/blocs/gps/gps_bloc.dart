import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  StreamSubscription? gpsServiceSuscription;
  GpsBloc()
      : super(const GpsState(
            isGpsEnable: false, isGpsPermissionGaranted: false)) {
    on<GpsAndPermissionEvent>((event, emit) => emit(state.copyWith(
        isGpsEnable: event.isGpsEnable,
        isGpsPermissionGaranted: event.isGpsPermissionsGaranted)));
    _init();
  }
  Future<void> _init() async {
    final isEnabled = await _checkGpsStatus();
    print(isEnabled);

    add(GpsAndPermissionEvent(
        isGpsEnable: isEnabled,
        isGpsPermissionsGaranted: state.isGpsPermissionGaranted));
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();
    gpsServiceSuscription = Geolocator.getServiceStatusStream().listen((event) {
      final isEnabled = (event.index == 1) ? true : false;
      print(isEnabled);
      add(GpsAndPermissionEvent(
          isGpsEnable: isEnabled,
          isGpsPermissionsGaranted: state.isGpsPermissionGaranted));
    });
    return isEnable;
  }

  Future<void> askGpsAccess() async {
    final PermissionStatus status = await Permission.location.request();
    switch (status) {
      case PermissionStatus.granted:
        add(GpsAndPermissionEvent(
            isGpsEnable: state.isGpsEnable, isGpsPermissionsGaranted: true));
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
      add(GpsAndPermissionEvent(
            isGpsEnable: state.isGpsEnable, isGpsPermissionsGaranted: false));
            openAppSettings();
    }
  }

  @override
  Future<void> close() {
    gpsServiceSuscription
        ?.cancel(); // si gpsServiceSuscription tiene un valor (?) cancelalo, si no no hagas nada
    return super.close();
  }
}
