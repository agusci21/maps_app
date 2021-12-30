import 'package:dio/dio.dart';

class PlacesInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'language': 'es',
      'limit': 7,
      'access_token':
          'pk.eyJ1IjoiYWd1c2NpMjEiLCJhIjoiY2t2ZmQyd3kxYm96MjMxbnp5aHJ0OXQyNiJ9.2GO3WoKvzdkst-kZuW6cHg',
    });
    super.onRequest(options, handler);
  }
}
