import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
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
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();
    Geolocator.getServiceStatusStream().listen((event) {
      final isEnabled = (event.index == 1) ? true : false;
      print(isEnabled);
    });
    return isEnable;
  }

  @override
  Future<void> close() {
    //TODO limpiar listener
    return super.close();
  }
}
