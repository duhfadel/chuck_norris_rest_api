import 'package:chuck_norris_rest_api/features/dashboard/model/joke_response.dart';

class JokesState {
  bool isLoading;
  List<Result>? jokeList;
  JokesState({this.isLoading = false, this.jokeList});
}
