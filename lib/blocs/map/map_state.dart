part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;
  final bool isShowingMyRoute;

  //PoliLines

  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;

  const MapState({
    this.isMapInitialized = false,
    this.isFollowingUser = true,
    this.isShowingMyRoute = true,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
  })  : polylines = polylines ?? const {},
        markers = markers ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? isFollowingUser,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
    bool? isShowingMyRoute,
  }) =>
      MapState(
          isMapInitialized: isMapInitialized ?? this.isMapInitialized,
          isFollowingUser: isFollowingUser ?? this.isFollowingUser,
          isShowingMyRoute: isShowingMyRoute ?? this.isShowingMyRoute,
          polylines: polylines ?? this.polylines,
          markers: markers ?? this.markers
          );

  @override
  List<Object> get props =>
      [isMapInitialized, isFollowingUser, polylines, isShowingMyRoute, markers];
}
