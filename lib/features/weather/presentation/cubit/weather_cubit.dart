import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_task/core/error/failures.dart';
import 'package:weather_app_task/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app_task/features/weather/presentation/cubit/weather_state.dart';



class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository,}) : super(const WeatherInitial());

  Future<void> getWeather(String city) async {
    if (city.trim().isEmpty) {
      emit(
        const WeatherError('Please enter a city name',),
      );
      return;
    }

    emit(const WeatherLoading());

    try {
      final weather = await weatherRepository.getCurrentWeather(
        city.trim(),
      );

      emit(WeatherSuccess(weather));
    } on NetworkFailure catch (e) {
      emit(WeatherError(e.message));
    } on ServerFailure catch (e) {
      emit(WeatherError(e.message));
    } catch (_) {
      emit(
        const WeatherError('Something went wrong',),
      );
    }
  }
}