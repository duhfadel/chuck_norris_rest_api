import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chuck_norris_rest_api/features/dashboard/cubit/jokes_state.dart';
import 'package:chuck_norris_rest_api/features/dashboard/model/joke_response.dart';
import 'package:chuck_norris_rest_api/features/remote_api/jokes_api.dart';

class JokesCubit extends Cubit<JokesState> {
  JokesCubit({
    required this.jokesApi,
    this.jokeList,
    this.query,
  }) : super(JokesState(isLoading: false));

  JokesApi jokesApi;
  List<Result>? jokeList = [];
  String? query;

  void fetchData(query) async {
    emit(
      JokesState(isLoading: true),
    );
    try {
      JokesResponse jokesResponse = await jokesApi.getJokes(query);
      jokeList = jokesResponse.result!;
    } catch (e) {
      print(e);
    } finally {
      emit(JokesState(
        isLoading: false,
        jokeList: jokeList,
        avatarText: query,
      ));
    }
  }
}
