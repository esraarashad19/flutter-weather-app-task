import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_task/features/weather/presentation/weather_screen.dart';

import 'core/shared_prefrences/shared_preference_service.dart';
import 'core/thems/app_theme.dart';
import 'features/weather/data/datasources/weather_local_data_source.dart';
import 'features/weather/data/datasources/weather_remote_data_source.dart';
import 'features/weather/data/repositories/weather_repository_impl.dart';
import 'features/weather/presentation/cubit/weather_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences =
  await SharedPreferences.getInstance();

  final sharedPreferencesService =
  SharedPreferencesService(
    preferences,
  );

  runApp(
    WeatherApp(
      sharedPreferencesService:
      sharedPreferencesService,
    ),
  );
}

class WeatherApp extends StatelessWidget {
  final SharedPreferencesService
  sharedPreferencesService;

  const WeatherApp({
    super.key,
    required this.sharedPreferencesService,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: RepositoryProvider(
        create: (_) => WeatherRepositoryImpl(
          remoteDataSource:
          WeatherRemoteDataSourceImpl(
            dio: Dio(),
          ),
          localDataSource:
          WeatherLocalDataSourceImpl(
            sharedPreferencesService:
            sharedPreferencesService,
          ),
        ),
        child: Builder(
          builder: (context) {
            return BlocProvider(
              create: (_) => WeatherCubit(
                weatherRepository:
                context.read<WeatherRepositoryImpl>(),
              ),
              child: const WeatherPage(),
            );
          },
        ),
      ),
    );
  }
}