import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  GpsBloc()
      : super(const GpsState(
            isGpsEnable: false, isGpsPermissionGaranted: false)) {
    on<GpsAndPermissionEvent>((event, emit) => emit(state.copyWith(
        isGpsEnable: event.isGpsEnable,
        isGpsPermissionGaranted: event.isGpsPermissionsGaranted)));
  }
}
