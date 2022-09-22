import 'package:dio/dio.dart';

class DioHttpClient {
  final Dio dio = Dio();

  DioHttpClient() {
    _setupDio();
  }

  String base = 'https://api.chucknorris.io/jokes';

//search path e query é parameter
  void _setupDio() {
    dio.options.baseUrl = base;
    dio.options.connectTimeout = const Duration(seconds: 30).inMilliseconds;
  }
}
