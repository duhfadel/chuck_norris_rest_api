import 'package:chuck_norris_rest_api/features/dashboard/cubit/jokes_cubit.dart';
import 'package:chuck_norris_rest_api/features/dashboard/pages/dashboard.dart';
import 'package:chuck_norris_rest_api/features/remote_api/jokes_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardProvider extends StatelessWidget {
  const DashboardProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JokesCubit>(
      create: (context) { 
        var cubit =  JokesCubit(
        jokesApi: context.read<JokesApi>(),
        
      );
      return cubit;
      },
      child: DashboardView(),
    );
  }
}
