part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;
  final bool isShowingMyRoute;

  //PoliLines

  final Map<String, Polyline> polylines;

  const MapState({
    this.isMapInitialized = false,
    this.isFollowingUser = true,
    this.isShowingMyRoute = true,
    Map<String, Polyline>? polylines,
  }) : polylines = polylines ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? isFollowingUser,
    Map<String, Polyline>? polylines,
    bool? isShowingMyRoute,
  }) =>
      MapState(
          isMapInitialized: isMapInitialized ?? this.isMapInitialized,
          isFollowingUser: isFollowingUser ?? this.isFollowingUser,
          isShowingMyRoute: isShowingMyRoute ?? this.isShowingMyRoute,
          polylines: polylines ?? this.polylines);

  @override
  List<Object> get props =>
      [isMapInitialized, isFollowingUser, polylines, isShowingMyRoute];
}
