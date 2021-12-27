import 'package:flutter/material.dart';

class SearchResult {
  final bool isCancel;
  final bool isManual;

  SearchResult({required this.isCancel, this.isManual = false});
  @override
  String toString() {
    return '{cancel: $isCancel, manual: $isManual}';
  }
}
