
import 'dart:convert';

import 'package:weather_app_task/core/shared_prefrences/shared_preference_service.dart';
import 'package:weather_app_task/core/shared_prefrences/shared_prefrences_keys.dart';
import 'package:weather_app_task/features/weather/data/model/weather_model.dart';

abstract class WeatherLocalDataSource {
  Future<void> cacheWeather(
      WeatherModel weather,
      );

  WeatherModel? getCachedWeather();
}


class WeatherLocalDataSourceImpl
    implements WeatherLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  WeatherLocalDataSourceImpl({
    required this.sharedPreferencesService,
  });

  @override
  Future<void> cacheWeather(
      WeatherModel weather,
      ) async {
    await sharedPreferencesService.setString(
      SharedPreferencesKeys.cachedWeather,
      jsonEncode(
        weather.toJson(),
      ),
    );
  }

  @override
  WeatherModel? getCachedWeather() {
    final cachedWeather =
    sharedPreferencesService.getString(
      SharedPreferencesKeys.cachedWeather,
    );

    if (cachedWeather == null) {
      return null;
    }

    try {
      return WeatherModel.fromJson(
        jsonDecode(cachedWeather),
      );
    } catch (_) {
      return null;
    }
  }
}