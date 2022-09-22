import 'package:dio/dio.dart';

class DioHttpClient {
  final Dio _dio = Dio();

  DioHttpClient() {
    _setupDio();
  }


  void _setupDio() {

    _dio.options.connectTimeout = const Duration(seconds: 30).inMilliseconds;
  }
}

extension HttpClientExtension on DioHttpClient {
  Dio get jokesClient {
    return _dio..options.baseUrl = 'https://api.chucknorris.io/jokes';
  }

  //not necessary!
  /*
  Dio avatarClient(){
    return _dio..options.baseUrl = 'https://avatars.dicebear.com/api';
  }
  */
}
