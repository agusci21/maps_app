import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:mapas_app/models/models.dart';
import 'package:mapas_app/services/services.dart';

class TrafficService {
  final Dio _dioTraffic;
  final Dio _dioPlaces;
  final String _baseTrafficUrl = 'https://api.mapbox.com/directions/v5/mapbox';
  final String _baseplacesUrl =
      'https://api.mapbox.com/geocoding/v5/mapbox.places';
  TrafficService()
      : _dioTraffic = Dio()..interceptors.add(TrafficInterceptor()),
        _dioPlaces = Dio()..interceptors.add(PlacesInterceptor());

  Future<TrafficResponse> getCoorsStartToEnd(LatLng start, LatLng end) async {
    final coorsString =
        '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';
    final url = '$_baseTrafficUrl/driving/$coorsString';

    final response = await _dioTraffic.get(url);
    final data = TrafficResponse.fromMap(response.data);
    return data;
  }

  Future getResultsByQuery(LatLng proximity, String query) async {
    if (query.isEmpty) return [];

    final url = '$_baseplacesUrl/$query.json';
    final resp = await _dioPlaces.get(url, queryParameters: {
      'proximity': '${proximity.longitude},${proximity.latitude}'
    });
    return [];
  }
}
