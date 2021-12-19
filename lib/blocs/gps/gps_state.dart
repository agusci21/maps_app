part of 'gps_bloc.dart';

class GpsState extends Equatable {
  final bool isGpsEnable;
  final bool isGpsPermissionGaranted;
  bool get isAllGranted => isGpsEnable && isGpsPermissionGaranted;
  const GpsState(
      {required this.isGpsEnable, required this.isGpsPermissionGaranted});

  GpsState copyWith({
    bool? isGpsEnable,
    bool? isGpsPermissionGaranted,
  }) =>
      GpsState(
          isGpsEnable: isGpsEnable ?? this.isGpsEnable,
          isGpsPermissionGaranted:
              isGpsPermissionGaranted ?? this.isGpsPermissionGaranted);

  @override
  List<Object> get props => [isGpsEnable, isGpsPermissionGaranted];

  @override
  String toString() =>
      '{isGpsEnable: $isGpsEnable, isGpsPermissionGaranted: $isGpsPermissionGaranted}';
}
