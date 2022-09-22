import 'package:chuck_norris_rest_api/features/dashboard/model/joke_response.dart';

abstract class JokesApi {
  Future<JokesResponse> getJokes(String text);
}
