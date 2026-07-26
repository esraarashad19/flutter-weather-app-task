import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_task/core/extentions/size_extensions.dart';
import 'package:weather_app_task/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_app_task/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather_app_task/features/weather/presentation/widgets/weather_empty_state.dart';
import 'package:weather_app_task/features/weather/presentation/widgets/weather_error_state.dart';
import 'package:weather_app_task/features/weather/presentation/widgets/weather_header.dart';
import 'package:weather_app_task/features/weather/presentation/widgets/weather_loading_state.dart';
import 'package:weather_app_task/features/weather/presentation/widgets/weather_search_section.dart';
import 'package:weather_app_task/features/weather/presentation/widgets/weather_success_state.dart';



class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late final TextEditingController _cityController;

  @override
  void initState() {
    super.initState();

    _cityController = TextEditingController();
  }

  @override
  void dispose() {
    _cityController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const WeatherHeader(),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),

                    WeatherSearchSection(
                      controller: _cityController,
                    ),

                    SizedBox(
                      height: 24.h,
                    ),

                    BlocBuilder<WeatherCubit, WeatherState>(
                      builder: (context, state) {
                        return _buildContent(
                          context,
                          state,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WeatherState state,) {
    switch (state) {
      case WeatherInitial():
        return const WeatherEmptyState();

      case WeatherLoading():
        return const WeatherLoadingState();

      case WeatherSuccess():
        return WeatherSuccessState(
          weather: state.weather,
        );

      case WeatherError():
        return WeatherErrorState(
          message: state.message,
          onRetry: () {
            context.read<WeatherCubit>().getWeather(
              _cityController.text,
            );
          },
        );
    }
  }
}