import 'package:chuck_norris_rest_api/features/dashboard/cubit/jokes_cubit.dart';
import 'package:chuck_norris_rest_api/features/dashboard/cubit/jokes_state.dart';
import 'package:chuck_norris_rest_api/features/details_screen/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final TextEditingController queryController = TextEditingController();
  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    JokesCubit jokesCubit = context.read<JokesCubit>();
    return Scaffold(
      backgroundColor: Colors.grey,
      body: WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          final maxDuration = Duration(seconds: 2);
          final isWarning =
              lastPressed == null || now.difference(lastPressed!) > maxDuration;
          if (isWarning) {
            lastPressed = DateTime.now();
            final snackBar = SnackBar(
              content: const Text('Double Click to Exit'),
              duration: maxDuration,
            );
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(snackBar);
            return false;
          } else {
            return true;
          }
        },
        child: BlocBuilder<JokesCubit, JokesState>(
            bloc: jokesCubit,
            builder: (context, state) {
              return SafeArea(
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      margin: EdgeInsets.zero,
                      color: Colors.black26,
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 4,
                            ),
                            SizedBox(
                              width: 300,
                              height: 40,
                              child: TextField(
                                controller: queryController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Search here',
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                String query = queryController.text;
                                jokesCubit.fetchData(query);
                                queryController.clear();
                              },
                              icon: const Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.jokeList?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsView(
                                    text: state.jokeList![index].value!,
                                    avatar: state.avatarText!,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                  ),
                                  color: Colors.white),
                              child: Text(
                                state.jokeList![index].value!,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
