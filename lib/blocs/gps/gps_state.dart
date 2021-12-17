part of 'gps_bloc.dart';

class GpsState extends Equatable {
  final bool isGpsEnable;
  final bool isGpsPermissionGaranted;
  const GpsState({required this.isGpsEnable, required this.isGpsPermissionGaranted});
  
  @override
  List<Object> get props => [isGpsEnable, isGpsPermissionGaranted];

  @override
  String toString() => '{isGpsEnable: $isGpsEnable, isGpsPermissionGaranted: $isGpsPermissionGaranted}';
}

