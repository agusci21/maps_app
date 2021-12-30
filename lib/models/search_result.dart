import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class SearchResult {
  final bool isCancel;
  final bool isManual;
  final LatLng? position;
  final String? name;
  final String? description;

  SearchResult(
      {this.position,
      this.name,
      this.description,
      required this.isCancel,
      this.isManual = false});
  @override
  String toString() {
    return '{cancel: $isCancel, manual: $isManual}';
  }
}
