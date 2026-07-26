import 'package:weather_app_task/core/error/exceptions.dart';
import 'package:weather_app_task/core/error/failures.dart';
import 'package:weather_app_task/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:weather_app_task/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app_task/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app_task/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Weather> getCurrentWeather(String city) async {
    try {
      final weatherModel =
      await remoteDataSource.getCurrentWeather(city);

      // Cache the latest successful weather response.
      await localDataSource.cacheWeather(weatherModel);

      return weatherModel.toEntity();
    } on NetworkException catch (e) {
      // Try to load the last cached weather when offline(if it belongs to the requested city).
      final cachedWeather = localDataSource.getCachedWeather();

      if (cachedWeather != null &&
          cachedWeather.location.name.toLowerCase() ==
              city.trim().toLowerCase()) {
        return cachedWeather.toEntity();
      }

      throw NetworkFailure(e.message);
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    }
  }
}