part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitializeEvent extends MapEvent {
  final GoogleMapController controller;

  const OnMapInitializeEvent(this.controller);
}

class OnStopFollowingUserEvent extends MapEvent {}

class OnStartFollowingUserEvent extends MapEvent {}

class OnUpdateUserPolilineEvent extends MapEvent {
  final List<LatLng> userHistory;
  const OnUpdateUserPolilineEvent(this.userHistory);
}

class OnDisplayPolylinesEvent extends MapEvent {
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;
  const OnDisplayPolylinesEvent(this.polylines, this.markers);
}


class OnToggleUserRoute extends MapEvent {}
