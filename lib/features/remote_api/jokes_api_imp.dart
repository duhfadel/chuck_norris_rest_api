import 'package:dio/dio.dart';
import 'package:chuck_norris_rest_api/features/dashboard/model/joke_response.dart';
import 'package:chuck_norris_rest_api/features/remote_api/jokes_api.dart';

class JokesApiImp implements JokesApi {
  final Dio dio;
  JokesApiImp({
    required this.dio,
  });

  @override
  Future<JokesResponse> getJokes(String text) async {

    Response response =
        await dio.get('/search', queryParameters: {'query': text});
    if (response.statusCode == 200) {
      return JokesResponse.fromJson(response.data);
    }
    throw response.data;
  }
}

