
import 'package:dio/dio.dart';
import 'package:weather_app_task/core/constatnts/api_constants.dart';
import 'package:weather_app_task/core/error/exceptions.dart';
import 'package:weather_app_task/features/weather/data/model/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String city);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dio;

  WeatherRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<WeatherModel> getCurrentWeather(String city) async {
    try {
      final response = await dio.get(
        ApiConstants.baseUrl,
        queryParameters: {
          'key': ApiConstants.apiKey,
          'q': city,
        },
      );

      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkException(
          'Please check your internet connection',
        );
      }
      final errorCode = e.response?.data?['error']?['code'];

      if (errorCode == 1006) {
        throw const ServerException(
          'City not found',
        );
      }

      throw ServerException(
        e.response?.data?['error']?['message'] ??
            'Something went wrong',
      );
    } catch (e) {
      throw const ServerException(
        'Something went wrong',
      );
    }
  }
}