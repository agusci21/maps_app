import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:mapas_app/models/models.dart';
import 'package:mapas_app/services/services.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  TrafficService trafficService;

  SearchBloc({required this.trafficService}) : super(const SearchState()) {
    on<OnActivateManualMarkerEvent>(
        (event, emit) => emit(state.copyWith(isDisplayedManualMarked: true)));

    on<OnDesactivateManualMarkerEvent>(
        (event, emit) => emit(state.copyWith(isDisplayedManualMarked: false)));
  }

  Future<RouteDestination> getCoorsStartToEnd(LatLng start, LatLng end) async {
    final trafficResponse = await trafficService.getCoorsStartToEnd(start, end);
    final geometry = trafficResponse.routes.first.geometry;
    final distance = trafficResponse.routes.first.distance;
    final duration = trafficResponse.routes.first.duration;

    final points = decodePolyline(geometry, accuracyExponent: 6);
    final latLngList = points
        .map((coors) => LatLng(coors[0].toDouble(), coors[1].toDouble()))
        .toList();
    return RouteDestination(
        points: latLngList, duration: duration, distance: distance);
  }
}
