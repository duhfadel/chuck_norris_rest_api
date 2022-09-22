import 'package:chuck_norris_rest_api/features/dashboard/pages/dashboard_provider.dart';
import 'package:chuck_norris_rest_api/features/http_client/dio_http_client.dart';
import 'package:chuck_norris_rest_api/features/remote_api/jokes_api.dart';
import 'package:chuck_norris_rest_api/features/remote_api/jokes_api_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<DioHttpClient>(
      create: (context) => DioHttpClient(),
      child: Builder(builder: (context) {
        return RepositoryProvider<JokesApi>(
          create: (context) =>
              JokesApiImp(dio: context.read<DioHttpClient>().dio),
          child: const MaterialApp(
            home: DashboardProvider(),
          ),
        );
      }),
    );
  }
}
