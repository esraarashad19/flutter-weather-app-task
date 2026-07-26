
import 'package:weather_app_task/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Weather> getCurrentWeather(String city);
}